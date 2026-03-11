# Solution for Task: - [Design Document](../../openspec/changes/enable-vector-boot-standalone/design.md)

# Implementation Plan: Enable Vector Boot Standalone

## 1. File Paths

To implement the "Self-Booting Texture" mandate, we need to modify the crate structure and introduce a new entry point.

### Create New Files
*   `vector_boot/src/bin/main.rs`: The new PID 1 entry point.
*   `vector_boot/Cargo.toml`: Update dependencies to include `libc` for system calls (optional, if not already present).

### Modify Existing Files
*   `vector_boot/Cargo.toml`: Update the `[[bin]]` section to define the standalone binary.
*   `vector_boot/src/lib.rs`: Refactor the initialization logic to be `pub` so the binary can call it.

---

## 2. Code Snippets

### A. `vector_boot/Cargo.toml`
Update the configuration to define the standalone binary alongside the library.

```toml
[package]
name = "vector_boot"
version = "0.1.0"
edition = "2021"

# ... existing library configuration ...

# Define the Standalone Binary (PID 1)
[[bin]]
name = "vector_boot"
path = "src/bin/main.rs"

[dependencies]
# ... existing dependencies ...
libc = "0.2" # Required for syscalls in standalone mode
```

### B. `vector_boot/src/bin/main.rs`
This is the new PID 1 entry point. It handles the handoff from the kernel and initializes the Neural Runtime.

```rust
use vector_boot::core::neural_runtime::NeuralRuntime;
use std::sync::Arc;

fn main() {
    // 1. Kernel Handoff (PID 1)
    // In a real environment, we would parse command line arguments here.
    // For this implementation, we proceed directly to initialization.
    
    eprintln!("Geometry OS: Vector Boot Standalone Initialized (PID 1)");
    
    // 2. Neural Runtime Initialization
    // This call replaces the Python FFI entry point.
    match NeuralRuntime::init() {
        Ok(runtime) => {
            eprintln!("Geometry OS: Neural Runtime Ready.");
            
            // 3. Enter Main Loop / Handoff
            // The system now runs purely on the vector stack.
            runtime.run_until_halt();
        }
        Err(e) => {
            eprintln!("Geometry OS: Critical Failure - {}", e);
            // Panic or halt as PID 1
            std::process::exit(1);
        }
    }
}
```

### C. `vector_boot/src/lib.rs`
Expose the necessary logic for the binary to use.

```rust
// ... existing code ...

pub mod core {
    pub mod neural_runtime {
        use super::super::tensor_engine::GGUFLoader;
        use std::sync::Arc;

        pub struct NeuralRuntime {
            // ... fields ...
        }

        impl NeuralRuntime {
            pub fn init() -> Result<Self, Box<dyn std::error::Error>> {
                // 1. Load GGUF tensors from memory
                let loader = GGUFLoader::new()?;
                eprintln!("Geometry OS: Tensors Loaded.");
                
                // 2. Initialize Hardware MMIO
                // (Simulated here)
                unsafe { 
                    // mmio_init(); 
                }
                
                Ok(NeuralRuntime { /* ... */ })
            }

            pub fn run_until_halt(&self) {
                // The loop that keeps the system alive
                loop {
                    // ... processing ...
                }
            }
        }
    }
}

// ... existing code ...
```

---

## 3. Next Steps

Execute the following command to build the standalone binary:

```bash
cargo build --release --bin vector_boot
```

Once built, the binary can be installed to your boot partition or run directly to verify the "Self-Booting" capability.