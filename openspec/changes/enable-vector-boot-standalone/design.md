# Design: Vector Boot Standalone Architecture

## Overview
This document details the technical design for transforming [`vector_boot`](vector_boot/Cargo.toml:1) from a passive FFI library into an active system init process (PID 1).

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    Kernel Boot Sequence                      │
│                    (Linux/VectorOS)                          │
└────────────────────────┬────────────────────────────────────┘
                         │
                         │ PID 1 Handoff
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              vector_boot (Standalone Binary)                │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  1. Neural Runtime Initialization                      │  │
│  │     - Load GGUF tensors from memory                    │  │
│  │     - Initialize hardware MMIO                          │  │
│  │     - Setup cortex_journal                              │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  2. The Heartbeat (Infinite Event Loop)               │  │
│  │     - Read hw.mmio tensor                             │  │
│  │     - Process neural interrupts                       │  │
│  │     - Execute metabolic daemon                        │  │
│  │     - Update system state                             │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  3. Evolution Engine Interface                         │  │
│  │     - Accept Python mutations via shared memory       │  │
│  │     - Apply weight updates to GGUF                     │  │
│  │     - Execute cortex_journal writes                   │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                         │
                         │ Optional: Python Evolution Layer
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              Evolution Engine (Python)                       │
│              (Optional - for development)                    │
│  - vector_evolution_loop.py                                 │
│  - VectorOSAgent.py                                         │
└─────────────────────────────────────────────────────────────┘
```

## Dual-Nature Compilation Strategy

### Compilation Modes

#### Mode 1: FFI Library (Default)
```bash
cargo build --release
```
Produces: `vector_boot/target/release/libvector_boot.so`

**Use Cases:**
- Python development and testing
- Rapid prototyping
- Integration with existing Python ecosystem

**Features:**
- Exposes FFI bindings for Python
- No main event loop
- Controlled by Python caller

#### Mode 2: Standalone Binary
```bash
cargo build --release --features standalone
```
Produces: `vector_boot/target/release/vector_boot`

**Use Cases:**
- Production boot as PID 1
- Minimal initramfs environments
- Self-contained OS deployment

**Features:**
- Full boot sequence
- Infinite event loop
- Direct GGUF tensor access

## Implementation Details

### 1. Cargo.toml Modifications

```toml
[package]
name = "vector_boot"
version = "0.1.0"
edition = "2021"

[lib]
name = "vector_boot"
crate-type = ["cdylib", "rlib"]

[[bin]]
name = "vector_boot"
path = "src/main.rs"
required-features = ["standalone"]

[features]
default = ["ffi"]
ffi = []
standalone = []

[dependencies]
# Future: gguf = "0.1.0" for Phase 17
```

**Key Changes:**
- Added `[[bin]]` target for standalone binary
- Added `required-features = ["standalone"]` to prevent bin compilation by default
- Added feature flags for conditional compilation

### 2. Main.rs Feature-Gated Implementation

```rust
#[cfg(feature = "standalone")]
mod standalone;

#[cfg(feature = "standalone")]
fn main() {
    standalone::boot_sequence();
}

#[cfg(not(feature = "standalone"))]
fn main() {
    println!("Vector Boot Wrapper - Use via FFI");
    println!("Build with: cargo build --release --features standalone");
}
```

### 3. Standalone Boot Module (src/standalone.rs)

```rust
use std::time::Duration;

pub fn boot_sequence() {
    println!("🚀 Vector Boot - Neural Runtime Init");
    
    // Phase 1: Initialize Neural Runtime
    if !initialize_neural_runtime() {
        eprintln!("❌ Failed to initialize neural runtime");
        std::process::exit(1);
    }
    
    println!("✅ Neural Runtime initialized");
    
    // Phase 2: Load GGUF Tensors
    if !load_gguf_tensors() {
        eprintln!("❌ Failed to load GGUF tensors");
        std::process::exit(1);
    }
    
    println!("✅ GGUF tensors loaded");
    
    // Phase 3: Enter Heartbeat Loop
    heartbeat_loop();
}

fn initialize_neural_runtime() -> bool {
    // Initialize global runtime state
    unsafe {
        if super::neural_init() != 1 {
            return false;
        }
    }
    
    // Setup hardware MMIO
    // Initialize cortex_journal
    // Configure metabolic daemon
    
    true
}

fn load_gguf_tensors() -> bool {
    // Load vectorland.gguf or embedded tensors
    // Parse tensor metadata
    // Map tensors into memory
    
    true
}

fn heartbeat_loop() {
    println!("💓 Entering Heartbeat Loop...");
    
    loop {
        // 1. Read hardware state
        let hw_state = read_hw_mmio();
        
        // 2. Process neural interrupts
        process_interrupts(hw_state);
        
        // 3. Execute metabolic daemon
        execute_metabolic_daemon();
        
        // 4. Sleep for next cycle
        std::thread::sleep(Duration::from_millis(100));
    }
}

fn read_hw_mmio() -> Vec<u8> {
    // Read from hw.mmio tensor
    vec![]
}

fn process_interrupts(state: Vec<u8>) {
    // Check for neural interrupts
    // Execute interrupt handlers
}

fn execute_metabolic_daemon() {
    // Run metabolic daemon logic
    // Update physics simulation
    // Monitor system health
}
```

### 4. FFI Compatibility Layer

The existing [`lib.rs`](vector_boot/src/lib.rs:1) remains unchanged, maintaining backward compatibility:

```rust
// All existing FFI functions remain:
// - neural_init()
// - neural_execute_pixels()
// - neural_get_result()
// - neural_free()
// - neural_cleanup()
// - neural_get_stats()
```

## RTS Packaging

### Build Script (build.rs)

```rust
use std::env;
use std::fs;
use std::path::PathBuf;

fn main() {
    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    
    // Only package for standalone builds
    if env::var("CARGO_FEATURE_STANDALONE").is_ok() {
        println!("cargo:rerun-if-changed=vectorland.gguf");
        
        // Copy GGUF file to output directory
        fs::copy("vectorland.gguf", out_dir.join("vectorland.gguf"))
            .expect("Failed to copy GGUF file");
    }
}
```

### RTS Format Structure

```
vector_boot.rts
├── [RTS Header: 512 bytes]
│   ├── Magic: "RTS\x01"
│   ├── Version: 1
│   ├── Binary Offset: 512
│   ├── Binary Size: N bytes
│   ├── Tensor Offset: 512 + N
│   └── Tensor Size: M bytes
├── [Binary Section: N bytes]
│   └── vector_boot executable
└── [Tensor Section: M bytes]
    └── vectorland.gguf
```

### Packaging Script (package_rts.sh)

```bash
#!/bin/bash
set -e

echo "📦 Packaging Vector Boot as RTS..."

# Build standalone binary
cargo build --release --features standalone

BINARY="vector_boot/target/release/vector_boot"
GGUF="vectorland.gguf"
OUTPUT="vector_boot.rts"

# Get sizes
BINARY_SIZE=$(stat -c%s "$BINARY")
GGUF_SIZE=$(stat -c%s "$GGUF")
HEADER_SIZE=512

# Create header
{
    echo -n "RTS\x01"
    printf "%08x" 1 | xxd -r -p  # Version
    printf "%016x" $HEADER_SIZE | xxd -r -p  # Binary offset
    printf "%016x" $BINARY_SIZE | xxd -r -p  # Binary size
    printf "%016x" $((HEADER_SIZE + BINARY_SIZE)) | xxd -r -p  # Tensor offset
    printf "%016x" $GGUF_SIZE | xxd -r -p  # Tensor size
    # Pad to 512 bytes
    dd if=/dev/zero bs=1 count=$((512 - 40)) 2>/dev/null
} > "$OUTPUT"

# Append binary and GGUF
cat "$BINARY" >> "$OUTPUT"
cat "$GGUF" >> "$OUTPUT"

echo "✅ RTS package created: $OUTPUT"
```

## Testing Strategy

### Unit Tests

```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_neural_init() {
        assert_eq!(neural_init(), 1);
        unsafe { neural_cleanup(); }
    }

    #[test]
    fn test_pixel_execution() {
        neural_init();
        
        let pixels = vec![
            Pixel { r: 72, g: 101, b: 108 },
            Pixel { r: 101, g: 108, b: 108 },
            Pixel { r: 108, g: 111, b: 111 },
            Pixel { r: 250, g: 255, b: 0 },
        ];
        
        let result = neural_execute_pixels(pixels.as_ptr(), pixels.len());
        assert_eq!(result, 1);
        
        unsafe { neural_cleanup(); }
    }

    #[cfg(feature = "standalone")]
    #[test]
    fn test_boot_sequence() {
        // Test standalone boot logic
        assert!(initialize_neural_runtime());
    }
}
```

### Integration Tests

1. **FFI Mode Test:**
   ```bash
   cargo build --release
   python3 systems/apps/test_rust_integration.py
   ```

2. **Standalone Mode Test:**
   ```bash
   cargo build --release --features standalone
   ./vector_boot/target/release/vector_boot
   # Should boot and enter heartbeat loop
   ```

3. **RTS Packaging Test:**
   ```bash
   ./package_rts.sh
   # Verify RTS format is valid
   ```

## Performance Considerations

### Memory Footprint

| Component | FFI Mode | Standalone Mode |
|-----------|----------|-----------------|
| Binary Size | ~500 KB | ~500 KB |
| Python Runtime | ~50 MB | 0 MB |
| GGUF Tensors | Shared | Embedded |
| Total | ~50.5 MB | ~5 MB |

### Boot Time

| Phase | FFI Mode | Standalone Mode |
|-------|----------|-----------------|
| Kernel Handoff | 10 ms | 10 ms |
| Python Init | 200 ms | 0 ms |
| Neural Runtime | 50 ms | 50 ms |
| Total | ~260 ms | ~60 ms |

**Improvement: ~200ms faster boot time**

## Security Considerations

1. **Privilege Separation:**
   - Standalone binary runs as PID 1 (root)
   - Must drop privileges where possible
   - Use Linux capabilities instead of full root

2. **Input Validation:**
   - Validate all GGUF tensor inputs
   - Bounds checking on all memory operations
   - Safe FFI boundaries

3. **Mutation Safety:**
   - CTRM (Critical Thought Reform Mechanism) must verify all mutations
   - Only apply mutations with >0.8 confidence
   - Reject mutations to critical `kernel.*` tensors

## Migration Path

### Phase 1: Dual Compilation (Current)
- Implement feature-gated compilation
- Maintain backward compatibility with FFI
- Test both modes independently

### Phase 2: Standalone Testing
- Test standalone boot in minimal environment
- Verify RTS packaging
- Performance benchmarking

### Phase 3: Production Deployment
- Switch production builds to standalone mode
- Remove Python dependency from initramfs
- Update deployment scripts

### Phase 4: Evolution Integration
- Integrate with Evolution Engine
- Enable runtime mutations
- Implement CTRM safety checks

## Rollback Plan

If issues arise:
1. Revert to FFI-only mode: `cargo build --release`
2. Disable standalone feature in CI/CD
3. Keep Python boot path as fallback
4. Document rollback procedures

## Future Enhancements

1. **Hot-Reloading:**
   - Support runtime binary updates
   - Zero-downtime upgrades
   - State preservation across reloads

2. **Distributed Boot:**
   - Multi-node coordination
   - Cluster initialization
   - Consensus-based boot

3. **Hardware Acceleration:**
   - GPU-based tensor loading
   - DMA for GGUF tensors
   - FPGA acceleration for neural ops
