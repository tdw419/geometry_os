# Solution for Task: - [OpenSpec Proposal](../../openspec/changes/enable-vector-boot-standalone/proposal.md)

Here is the implementation plan for transforming `vector_boot` into a standalone PID 1 system.

### 1. File Paths

To implement the "Dual-Nature" Mandate (FFI Library + Standalone Binary), we need to restructure the project layout and introduce a new binary entry point.

**Files to Create:**
*   `vector_boot/src/bin/vector_boot.rs` (The new PID 1 entry point)
*   `vector_boot/Cargo.toml` (Modified to include binary target)

**Files to Modify:**
*   `vector_boot/Cargo.toml` (Add `[[bin]]` section and dependencies)
*   `vector_boot/src/lib.rs` (Extract core logic to be shared between lib and bin)

---

### 2. Code Snippets

#### A. Cargo.toml (Modified)
We need to enable the binary target and ensure the necessary system crates (like `nix` for PID 1 handling) are available.

```toml
[package]
name = "vector_boot"
version = "0.1.0"
edition = "2021"

# ... existing dependencies ...

# --- NEW: Standalone Binary Target ---
[lib]
crate-type = ["cdylib", "rlib"]

[[bin]]
name = "vector_boot"
path = "src/bin/vector_boot.rs"
required-features = ["standalone"]

[features]
default = []
standalone = ["dep:nix", "dep:libc"]
```

#### B. src/bin/vector_boot.rs (New File)
This file acts as the PID 1 entry point. It handles the handoff from the kernel, initializes the Neural Runtime, and then spins up the main Python interpreter or GGUF worker.

```rust
use nix::unistd::{setsid, setsid, fork, ForkResult};
use nix::sys::signal::{sigaction, SigAction, SigHandler, SaFlags, SigSet, SIGCHLD};
use std::os::unix::process::ExitCode;
use vector_boot::neural_runtime::init_gguf_engine;

fn main() -> ExitCode {
    // 1. Fork to become a daemon (optional, but good practice for PID 1)
    match unsafe { fork() } {
        Ok(ForkResult::Parent(_)) => return ExitCode::SUCCESS, // Parent exits
        Ok(ForkResult::Child) => {},
        Err(_) => eprintln!("Fork failed!"),
    }

    // 2. Create a new session (become session leader)
    if setsid().is_err() {
        eprintln!("Failed to create new session");
        return ExitCode::from(1);
    }

    // 3. Signal Handling: Ignore SIGCHLD to prevent zombies
    unsafe {
        let sig_action = SigAction::new(
            SigHandler::SigIgn,
            SaFlags::SA_NOCLDSTOP,
            SigSet::empty(),
        );
        sigaction(SIGCHLD, &sig_action).expect("Failed to set signal handler");
    }

    // 4. Neural Runtime Initialization
    println!("Vector OS: Initializing Neural Runtime...");
    match init_gguf_engine() {
        Ok(_) => println!("Vector OS: Neural Engine Ready."),
        Err(e) => {
            eprintln!("Vector OS: CRITICAL FAILURE - Neural Engine init failed: {}", e);
            return ExitCode::from(2);
        }
    }

    // 5. Handoff to Python Interpreter (The "Texture")
    // This loop mimics the "Main Loop" of the system
    println!("Vector OS: Handing off to Python Runtime (PID 1)...");
    vector_boot::python_interpreter::run_main_loop();

    ExitCode::from(0)
}
```

#### C. src/lib.rs (Modified)
We need to expose the Python runtime logic so the binary can use it.

```rust
// ... existing imports ...

// 1. Expose the Python init function
pub fn python_interpreter() -> Result<(), String> {
    // Initialize Python interpreter in standalone mode
    // (Omits site initialization for faster boot)
    unsafe {
        let ptr = pyo3::prepare_freethreaded_python();
        pyo3::Python::acquire_gil(ptr);
    }
    Ok(())
}

// 2. The main loop that bridges Rust and Python
pub fn run_main_loop() {
    loop {
        // This would normally poll hardware MMIO or events
        // For now, we just keep the system alive
        std::thread::sleep(std::time::Duration::from_millis(100));
    }
}

// 3. Keep existing FFI logic here for the Python wrapper
pub mod ffi {
    // ... existing FFI bindings ...
}
```

---

### 3. Next Steps

Execute the following command to create the necessary files and build the standalone binary:

```bash
cd vector_boot && cargo new --bin vector_boot && touch src/bin/vector_boot.rs && cargo build --release --features standalone
```