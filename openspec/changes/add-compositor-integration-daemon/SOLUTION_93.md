# Solution for Task: Add health check endpoint

## Context

The task is to add an endpoint for health check monitoring in Geometry OS that can be used by the Geometry OS Implementation Agent (IA) to ensure the system's stability and performance. The following file paths need to be created or modified:

1. `systemd`: create a new file named `geometryos-healthcheck.service` with the following content:

```
[Unit]
Description=Geometry OS Health Check Service
After=syslog.target

[Service]
User=root
Group=root
WorkingDirectory=/usr/local/sbin
ExecStart=/usr/local/bin/geometryos-healthcheck
Restart=always
RestartSec=5s
TimeoutStopSec=30s
KillMode=process

[Install]
WantedBy=multi-user.target
```

2. `systemd`: create a new file named `geometryos-healthcheck.timer` with the following content:

```
[Unit]
Description=Geometry OS Health Check Timer
After=systemd-tmpfiles-wait.service
OnCalendar=15*5

[Timer]
Type=Cron
CrondMisfire=-0 0/5 * * * *
Crontab=@reboot /usr/local/bin/geometryos-healthcheck
```

3. `Rust`: create a new file named `geometryos_healthcheck.rs` with the following content:

```rust
use std::env;
use std::fs::File;
use std::io::Read;

fn main() {
    let mut healthcheck_file = File::open("geometryos-healthcheck").expect("Failed to open health check file");
    let mut contents: String = String::new();
    healthcheck_file.read_to_string(&mut contents).unwrap();
    
    // Check if the file exists and is not empty
    if !contents.trim().is_empty() && contents != "HEALTHY" {
        eprintln!("Health check failed! File: {}", contents);
        exit(1);
    }
}
```

## Planning steps

- Create a new file with the `geometryos-healthcheck.service` content, which will be used by the Geometry OS Implementation Agent (IA) to start and stop the health check service.
- Create a new file with the `geometryos-healthcheck.timer` content, which will be used by the IA to set up the health check timer.
- In Rust, create a new file named `geometryos_healthcheck.rs`, which can be used by the IA to check if the Geometry OS system is healthy or not. 

## Next steps

1. Create a new service file for the Geometry OS Implementation Agent, with the contents provided in the previous step.
2. Set up the health check timer as described in step 3, using the `Cron` daemon and `GeometryOS-HealthCheck.timer` file created in step 2.
3. Test the health check service by starting or stopping the IA, and observing the output in `systemd`.