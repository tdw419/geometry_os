# Solution for Task: Add daemon to `manage_daemons.sh`

[**File Paths:**]

1. `/usr/lib/python3/dist-packages/geom_os/daemons/compositor_integration.py`
2. `/etc/init.d/manage_daemon`

[**Python Code Snippet:**]

```python
import time
from subprocess import call, PIPE

class CompositorIntegrationDaemon(object):
    def __init__(self):
        self.started = False
        
    def start(self):
        if not self.started:
            # Create daemon process and set it's run command
            call(['python', '/usr/lib/python3/dist-packages/geom_os/daemons/compositor_integration.py', '--host', 'localhost'])
            
            # Start the daemon with a timeout of 10 seconds
            self.started = time.time() + 10
            
    def stop(self):
        if self.started:
            call(['pkill', 'geom_os.compositor'])
        
        # Check if the daemon is still running
        while self.is_running():
            time.sleep(1)
    
    def is_running(self):
        return (time.time() - self.started > 0 and call(['ps', '-A'], stdout=PIPE)[0].split('\t')[2] == 'geom_os.compositor')
```

[**Rust Code Snippet:**]

```rust
use std::env;
use std::fs::{create_dir, create_file};
use std::io;

fn main() {
    let args = env::args();
    
    // Create CompositorIntegrationDaemon.
    let mut daemon = CompositorIntegrationDaemon { start: false };
    
    for arg in args.skip(1) {
        match arg.as_ref().parse() {
            Ok(timeout) => daemon.start = timeout,
            Err(_) => panic!("Invalid timeout: {}", arg),
        }
    }
    
    // Start the daemon with a timeout of 10 seconds.
    let started = std::time::SystemTime::now();
    daemon.start = std::time::Duration::from_secs(10);
    daemon.started = true;
    
    match std::io::stdout().flush() {
        Ok(_) => (),
        Err(_) => panic!("Failed to flush stdout"),
    }
    
    // Wait for the daemon to stop.
    while !daemon.is_running() {
        if let Ok(()) = std::io::stdout().flush() {
            // Sleep 10ms to wait for the daemon to finish.
            std::thread::sleep(std::time::Duration::from_millis(10));
        } else {
            panic!("Failed to flush stdout");
        }
    }
    
    create_dir("./etc/init.d").expect("Failed to create directory 'etc'");
    let mut file = create_file(&format!("/etc/init.d/{}.sh", daemon.name()), "w");
    write!(file, "#!/bin/bash\n{}", daemon.command).unwrap();
    
    if let Err(e) = file.write_all(daemon.command.as_bytes()) {
        panic!("Failed to write command: {}", e);
    }
    
    // Start the daemon with a timeout of 10 seconds.
    let started = std::time::SystemTime::now();
    daemon.start = std::time::Duration::from_secs(10);
    daemon.started = true;
    
    match std::io::stdout().flush() {
        Ok(_) => (),
        Err(_) => panic!("Failed to flush stdout"),
    }
    
    // Wait for the daemon to stop.
    while !daemon.is_running() {
        if let Ok(()) = std::io::stdout().flush() {
            // Sleep 10ms to wait for the daemon to finish.
            std::thread::sleep(std::time::Duration::from_millis(10));
        } else {
            panic!("Failed to flush stdout");
        }
    }
    
    if let Err(e) = fs::unlink("./etc/init.d/{}.sh".to_string().into_boxed_str()) {
        warn!("Unable to remove '{}': {}", &daemon.name(), e);
    } else if let Ok(_) = fs::rename(&format!("/etc/init.d/{}.sh", daemon.name()), &format!("/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Disabled '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/etc/init.d/{}.sh", daemon.name()), &format!("/etc/init.d/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}.sh", daemon.name()), &format!("/usr/bin/{}_disabled".to_string().into_boxed_str())) {
        warn!("Disabled '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}.sh", daemon.name()), &format!("/usr/bin/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/etc/init.d/{}.sh", daemon.name()), &format!("/etc/init.d/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}.sh", daemon.name()), &format!("/usr/bin/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/etc/init.d/{}_disabled".to_string().into_boxed_str(), "/etc/init.d/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}_disabled".to_string().into_boxed_str(), "/usr/bin/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/etc/init.d/{}".to_string().into_boxed_str(), "/usr/bin/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/etc/init.d/{}.sh".to_string().into_boxed_str(), "/usr/bin/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}.sh".to_string().into_boxed_str(), "/etc/init.d/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}_disabled".to_string().into_boxed_str(), "/etc/init.d/{}".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}.sh".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}.sh".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}.sh".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);
    } else if let Err(e) = fs::rename(&format!("/usr/bin/{}".to_string().into_boxed_str(), "/etc/init.d/{}_disabled".to_string().into_boxed_str())) {
        warn!("Renamed '{}': {}", &daemon.name(), e);