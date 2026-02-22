# Solution for Task: Add camera bounds checking

## Context

The Geometry OS Implementation Agent was tasked with implementing camera bounds checking for the OpenSpec task "Add PiXi Improvement Daemon". The goal of this implementation is to detect when the camera's framing parameters are outside the bounds that are specified by the user.

## Goal and Context

The goal of this implementation is to provide a concise and effective solution for detecting camera framing boundaries in OpenSpec. The context of this task is to improve the accuracy and reliability of PiXi's camera, which plays an essential role in the project's success.

## File Paths Required

1. A file path for creating a new folder where camera bounds checking will be performed. This will be used by OpenSpec to store the results of camera framing checks.
2. A Python or Rust code snippet that creates a new folder if it does not already exist, and runs a script to perform camera bound checking.
3. A 'Next Step' command for users, indicating how to create a new folder and run the script.

## Snippet of Python Code Required

```python
import os
import subprocess
from pathlib import Path

# Define new folder path
folder_path = '/tmp/piXi_camera_bounds_check'

# Create new folder if it does not already exist
if not Path(folder_path).is_dir():
    os.makedirs(folder_path)

# Run script to perform camera bounds checking
subprocess.run(['python', './scripts/camera_bounds_checker.py'], cwd=folder_path)
```

## Snippet of Rust Code Required

```rust
use std::env;
use std::fs;

fn main() {
    // Define new folder path
    let mut folder_path = fs::canonicalize("tmp/piXi_camera_bounds_check").unwrap();
    
    // Create new folder if it does not already exist
    if !folder_path.exists() {
        fs::create_dir(folder_path).expect("Failed to create directory");
    }

    // Run script to perform camera bounds checking
    let mut cmd = env::current_exe().unwrap();
    cmd.push("./scripts/camera_bounds_checker.py");
    cmd.set_args(&["-f", folder_path.to_str().unwrap()]);
    
    // Run command and wait for it to finish
    let output = cmd.output().expect("Failed to execute command");
    if !output.status.success() {
        panic!("Camera bounds checking failed: {:?}", output.stderr);
    }
}
```

## Next Step Command in Markdown Format

```markdown
Next Step:
Create a new folder and run the script:

1. Create a new folder using `mkdir` command, e.g., `sudo mkdir /tmp/piXi_camera_bounds_check`.
2. Run the script with `-f`, followed by the folder path, e.g., `python ./scripts/camera_bounds_checker.py -f /tmp/piXi_camera_bounds_check`.
```