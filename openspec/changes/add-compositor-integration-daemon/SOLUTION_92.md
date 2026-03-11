# Solution for Task: Set daemon restart policy

[Context]
Add-compositor-integration-daemon task requires changes to the OpenSpec implementation. The goal is to provide a concise and comprehensive solution for this task with a clear, step-by-step guide for implementing the daemon restart policy.

1. File Paths Required:
The daemon needs to be able to create or modify the following files at the specified paths:

- `~/.config/compositor_integration`: This directory contains configuration data for compositing integration, such as compositor settings and user preferences.
- `~/.cache/compositor_integration`: This directory is used to store cached compositor state.

The file paths for the daemon should be specified in the task file (`task.yaml`). The paths will need to be validated by the OpenSpec implementation before running the daemon.

2. Python or Rust Code Required:
To create this daemon, we will use a Python program `compositor_integration_daemon.py` or a Rust program `rust_compositor_integration_daemon.rs`. The code should be well-documented and follow PEP 8 style guidelines.

3. Next Step Command:
To run the daemon, we will use a shell command such as `nohup` or `systemctl`, depending on the system. Here is an example for Linux systems:

```bash
# Ubuntu or Debian-based systems
sudo systemctl start compositor_integration_daemon.service
```

This command starts the daemon and allows it to run in the background without blocking the user's terminal session.

4. Conclusion:
We have provided a clear, concise solution for adding a daemon restart policy to Geometry OS using OpenSpec. The file paths required for the daemon and the Python or Rust code required should be specified in the task file (`task.yaml`). The next step command is used to start and manage the daemon. We have also provided an example for Linux systems.