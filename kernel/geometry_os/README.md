# Phase 3: Kernel Module

Direct glyph execution via `/dev/geometry_os` character device.

## Build & Install

```bash
cd kernel/geometry_os
make
sudo insmod geometry_os.ko
```

## Usage

```rust
use infinite_map_rs::backend::kernel::{KernelInterface, GpuInfo};

// Open kernel module
let kern = KernelInterface::open()?;

// Query GPU info
let info = kern.get_gpu_info()?;
println!("GPU: {:04x}:{:04x}", info.vendor_id, info.device_id);

// Execute glyph program
let spirv = compile_glyphs();  // From glyph_compiler
let result = kern.execute(&spirv, 64, 1, 1)?;
println!("Cycles: {}", result.cycles);

// Export for display
let dmabuf = kern.export_dmabuf()?;
```

## IOCTL Interface

| IOCTL | Description |
|-------|-------------|
| SUBMIT | Submit SPIR-V binary |
| EXEC | Start execution |
| WAIT | Wait for completion |
| INFO | Query GPU info |
| DMABUF | Export output buffer |

## Files

```
kernel/geometry_os/
├── main.c              # Kernel module implementation
├── geometry_os_uapi.h  # Userspace API header
├── Makefile            # Build configuration
├── test_geom_os.c      # C test program
└── run_test.sh         # Test runner
```

## Architecture

```
Userspace (glyph_compiler)
        ↓ ioctl(SUBMIT)
/dev/geometry_os
        ↓ MMIO
GPU Compute Engine
        ↓ DMA-BUF
KMS Display
```
