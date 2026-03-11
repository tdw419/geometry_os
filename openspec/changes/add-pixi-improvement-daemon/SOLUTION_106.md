# Solution for Task: Add history limit and cleanup

[Your Name]

[Your Organization/Company]

Subject: [Change ID] - Add PiXi Improvement DAemon

Dear [Task Creator],

I am pleased to present my proposal for the implementation of a new feature on Geometry OS. The proposed feature, named "PiXi Improvement DAemon," is designed to address specific issues related to the current codebase and improve its performance over time.

The proposed change involves creating two new daemons (one for history management and one for cleanup) that will be automatically launched upon system startup. The history management daemon will keep track of changes made to geometry files, allowing for seamless revert backs to previous versions. Similarly, the cleanup daemon will remove temporary files and directories created during geometry operations.

To achieve this feature's goals, I propose the following solution:

1. File paths - The history management daemon will require access to a file path that contains a list of all the geometry files stored in Geometry OS. This information will be retrieved from the Geometry OS metadata store using the `geom_os_metadata` API.

2. Python code - I have created a minimalistic implementation of this feature in Python, which uses the `subprocess` library to launch and monitor the daemons. The daemon's process will be started automatically upon system startup with the following command:

```python
import subprocess

# Define command line arguments for daemon
daemon_args = (
    "--history-manager",  # Run history management daemon
    "-h",                   # History file path
    "/path/to/history.txt"  # History file path
)

# Launch daemon and monitor its status
subprocess.run(daemon_args, check=True)
```

3. Rust code - I have also created a minimalistic implementation of the cleanup daemon in Rust using `tokio` and `async-std`. This daemon will require access to a file path that contains a list of all temporary files and directories created during geometry operations. The daemon's process will be started automatically upon system startup with the following command:

```rust
use std::env;
use tokio::runtime::Runtime;

const TMP_DIR: &str = "tmp";

fn run_daemon() {
    let mut runtime = Runtime::new().unwrap();

    runtime.block_on(async move {
        // List all temporary files and directories
        let tmp_dir = env::var("TMPDIR").unwrap_or_else(|err| {
            error!("Failed to get TMPDIR environment variable: {}", err);
            std::process::exit(-1);
        });

        let mut files = fs::read_dir(&tmp_dir).unwrap();
        while let Some(file) = files.next().await {
            if file.is_ok() && !file.unwrap().path().as_os_str().to_str().unwrap_or("").starts_with(".") {
                // Remove temporary file
                fs::remove_file(&file.unwrap().path()).unwrap();
            }
        }
    });
}

fn main() {
    run_daemon().await;
}
```

The daemons will be launched by adding the following commands to your `~/.config/geometry-os/startup` file:

```bash
# History management daemon
-h /path/to/history.txt

# Cleanup daemon
-h /path/to/cleanup.txt
```

Finally, please provide me with feedback on the proposed solutions and any necessary changes to ensure successful implementation. I look forward to hearing from you soon!