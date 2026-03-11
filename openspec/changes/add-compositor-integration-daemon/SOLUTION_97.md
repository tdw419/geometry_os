# Solution for Task: Create start/stop/restart commands

[Your Name]
[Your Title]
[Company Name]
[Address]
[City, State ZIP Code]
[Email address]
[Phone number]

[Date]

Geometry OS Implementation Agent

I am pleased to present the proposed implementation plan for the OpenSpec task change ID: [Change ID]. This proposal aims to provide a concise and effective solution to integrate the Geometry OS Compositor Daemon into the Geometry OS kernel. 

As per the given task, we need to create start/stop/restart commands that will allow users to easily manage the Geometry OS Compositor Daemon (GCD). The following file paths require modification:

- `/lib/systemd/system`: Create a service file for the GCD daemon. This should contain systemd unit configuration settings for starting, stopping, and restarting the GCD daemon.
- `/etc/rc.local`: Add a startup command for the Geometry OS Compositor Daemon (GCD) as follows:

```bash
#!/bin/sh
echo "Running Geometry OS Compositor Daemon..."
[ -f /var/run/gcd.socket ] && [ -S /var/run/gcd.sock ] || {
    echo "Failed to start GCD daemon, assuming it's already running."
}
exec "$@"
```

This `rc.local` script will start the Geometry OS Compositor Daemon (GCD) upon system boot and keep it running until explicitly stopped by the user.

In terms of python or rust code required, we can create a small utility script that handles systemd service management using the `systemd-run` command. Here's an example Python code snippet:

```python
import subprocess

def start_service(socket_path):
    cmd = f"systemd-run --scope --type=oneshot --user --no-daemon {sys.executable} {socket_path} start"
    print(f"Starting GCD daemon on {socket_path}")
    subprocess.check_call(cmd)

def stop_service():
    cmd = f"systemd-run --scope --type=oneshot --user --no-daemon {sys.executable} {socket_path} stop"
    print(f"Stopping GCD daemon on {socket_path}")
    subprocess.check_call(cmd)

def restart_service():
    cmd = f"systemd-run --scope --type=oneshot --user --no-daemon {sys.executable} {socket_path} restart"
    print(f"Restarting GCD daemon on {socket_path}")
    subprocess.check_call(cmd)
```

A `rust` implementation is also possible, using the `systemd-run` command with a `start` and `stop` method. Here's an example Rust code snippet:

```rust
use std::env;
use std::os::unix::process::CommandExt;
use std::path::PathBuf;

fn start_service() -> Result<(), Box<dyn std::error::Error>> {
    // Replace with your GCD daemon command and path to socket file.
    let socket_path = env::var("TMPDIR")?
        .parse::<PathBuf>()?
        .join(format!("{}.socket", env::current_user()));

    Command::new("systemd-run")
        .args(&["--scope", "--type=oneshot", "--user", "--no-daemon", "{} start"])
        .env("SYSTEMD_UNIT", "gcd.service")?
        .stdout(std::io::stderr())
        .spawn()?
        .wait_with_output()?;

    Ok(())
}

fn stop_service() -> Result<(), Box<dyn std::error::Error>> {
    Command::new("systemd-run")
        .args(&["--scope", "--type=oneshot", "--user", "--no-daemon", "{} stop"])
        .env("SYSTEMD_UNIT", "gcd.service")?
        .stdout(std::io::stderr())
        .spawn()?
        .wait_with_output()?;

    Ok(())
}

fn restart_service() -> Result<(), Box<dyn std::error::Error>> {
    Command::new("systemd-run")
        .args(&["--scope", "--type=oneshot", "--user", "--no-daemon", "{} restart"])
        .env("SYSTEMD_UNIT", "gcd.service")?
        .stdout(std::io::stderr())
        .spawn()?
        .wait_with_output()?;

    Ok(())
}
```

In terms of the 'Next Step' command, you can create an executable file with the following contents:

```bash
#!/bin/sh
echo "Now restarting GCD daemon..."
if [ -f /var/run/gcd.socket ]; then
    kill -USR1 $(cat /var/run/gcd.socket)
else
    echo "GCD daemon not running, exiting."
fi
```

This script will restart the Geometry OS Compositor Daemon (GCD) upon system boot. The `kill` command is used to send a signal to a process, in this case, the GCD daemon.

I hope these implementation plans help you in integrating the Geometry OS Compositor Daemon into your OpenSpec project! If you have any questions or concerns, please let me know.