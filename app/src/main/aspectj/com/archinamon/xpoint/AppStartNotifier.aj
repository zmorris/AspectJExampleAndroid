import android.app.Application;
import android.app.NotificationManager;
import android.content.Context;
import android.support.v4.app.NotificationCompat;

aspect AppStartNotifier {

    pointcut postInit(): within(Application) && execution(* Application.onCreate());

    after() returning: postInit() {

        // <- if you set a breakpoint here, it's never called

        Application app = (Application) thisJoinPoint.getTarget();
        NotificationManager nmng = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
        nmng.notify(9999, new NotificationCompat.Builder(app)
                .setTicker("Hello AspectJ")
                .setContentTitle("Notification from aspectJ")
                .setContentText("privileged aspect AppAdvice")
//                .setSmallIcon(R.drawable.ic_launcher)
                .build());
    }
}