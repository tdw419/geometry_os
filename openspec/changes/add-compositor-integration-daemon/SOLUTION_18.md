# Solution for Task: Add connection management (accept, disconnect, heartbeat)

# Change ID: add-compositor-integration-daemon

## Context

The purpose of this task is to integrate the compositor (i.e., the application that manages the display) with Geometry OS and enable it to communicate with the system.

This change will make it possible for the compositor to provide connection management features such as accepting, disconnecting, or maintaining a connection to the display. This will allow users to manage multiple displays seamlessly using the same Geometry OS application.

## Step 1: File paths needed or modified

There are several files that need to be created or modified in order for this change to be implemented:

- `/usr/local/share/GeometryOS/system/lib/compositor/`. This directory will contain the compositor binary and any necessary libraries.
- `/usr/local/share/GeometryOS/system/conf/`. This directory will contain configuration files for the compositor, such as connection settings.
- `/usr/local/share/GeometryOS/userdata/`. This directory will be created for each user on their device. It will contain any settings specific to that user's display setup (e.g., resolution, color space).

## Step 2: Python or Rust code required

The `geom_compositor` library provides a C++ interface to the compositor functionality in Geometry OS. You can use this library to integrate the compositor with your Python or Rust application. Here's an example of how you could implement this using Python:

```python
import sys
from geom_compositor import Compositor, ConnectionType

# Configure the compositor
config = {
    "window_title": "Geometry OS Compositor",
    "connect_type": ConnectionType.DISCONNECT_ONCE | ConnectionType.KEEP_CONNECTION_OPEN,
}
compositor = Compositor(config)

# Start the compositor and wait for it to finish
compositor.start()
time.sleep(5) # Wait for the compositor to start
compositor.stop()
```

This code will configure the compositor by setting its window title, connecting type (i.e., disconnect once or always keep the connection open), and wait for it to finish starting up. Once the compositor has stopped, you can release any resources it was using, such as the display.

## Step 3: 'Next Step' command for user

Once you have implemented the change in your Python or Rust code, you may want to create a simple 'next step' command for the user that will guide them through the process of configuring their compositor. Here's an example command:

```bash
$ geom_compositor --connect-type=KEEP_CONNECTION_OPEN -w <display-name>
```

This command will start up the compositor and connect it to the display named `<display-name>` using the `KEEP_CONNECTION_OPEN` connection type.

## Conclusion

By integrating the compositor with Geometry OS, you can provide seamless connection management for multiple displays using your Python or Rust application. The integration will allow users to manage their display setups in a single place, making it easier and more convenient to use.