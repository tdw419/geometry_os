# Glyph-to-Metal Pipeline

Complete path from AI-evolved glyphs to bare metal GPU execution.

## Pipeline Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                    GLYPH-TO-METAL PIPELINE                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   Phase 1: Glyph → SPIR-V                                          │
│   ┌─────────────┐     ┌─────────────┐                              │
│   │ Glyph Ops   │ ──► │   SPIR-V    │                              │
│   │  200-227    │     │   Binary    │                              │
│   └─────────────┘     └─────────────┘                              │
│         │                    │                                      │
│         ▼                    ▼                                      │
│   glyph_compiler/       30 words,                                   │
│   src/bin/              magic=0x07230203                            │
│                                                                     │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   Phase 2: DRM/KMS Direct Execution                                │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐          │
│   │   Intel     │     │   AMDGPU    │     │   DMA-BUF   │          │
│   │    i915     │     │    PM4      │     │  Zero-Copy  │          │
│   └─────────────┘     └─────────────┘     └─────────────┘          │
│         │                    │                    │                 │
│         └────────────────────┼────────────────────┘                 │
│                              ▼                                      │
│                    /dev/dri/renderD128                              │
│                                                                     │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   Phase 3: Kernel Module                                            │
│   ┌─────────────────────────────────────────────────────┐          │
│   │              /dev/geometry_os                        │          │
│   │  ┌─────────┬─────────┬─────────┬─────────┬────────┐ │          │
│   │  │ SUBMIT  │  EXEC   │  WAIT   │  INFO   │ DMABUF │ │          │
│   │  └─────────┴─────────┴─────────┴─────────┴────────┘ │          │
│   └─────────────────────────────────────────────────────┘          │
│                              │                                      │
│                    geometry_os.ko (399KB)                           │
│                                                                     │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   Phase 4: Bare Metal Boot                                          │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐          │
│   │    UEFI     │     │   Kernel    │     │    GPU      │          │
│   │ Bootloader  │ ──► │   Entry     │ ──► │   Direct    │          │
│   │ BOOTX64.EFI │     │   10KB      │     │   MMIO      │          │
│   └─────────────┘     └─────────────┘     └─────────────┘          │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Phase Status

| Phase | Description | Status | Tests |
|-------|-------------|--------|-------|
| 1 | Glyph → SPIR-V Compiler | ✅ Complete | 5 |
| 2 | DRM/KMS Direct Execution | ✅ Complete | 8 |
| 3 | Kernel Module | ✅ Complete | 2 |
| 4 | Bare Metal Boot | ✅ Scaffold | - |

## Quick Start

### Phase 1: Compile Glyphs
```bash
cd systems/glyph_compiler
cargo run -- compile  # Reads glyph JSON, outputs SPIR-V
```

### Phase 2: Execute on GPU
```rust
use infinite_map_rs::backend::drm::{IntelCommandBuffer, GlyphCompute};

let mut cb = IntelCommandBuffer::new();
cb.begin_batch()
  .set_media_vfe(0x100000000, 0x10000)
  .dispatch(64, 1, 1)
  .end_batch();
```

### Phase 3: Kernel Module
```bash
cd kernel/geometry_os
make
sudo insmod geometry_os.ko
./test_geom_os
```

### Phase 4: Bare Metal
```bash
cd kernel/geos
make
qemu-system-x86_64 -kernel geometry_os.kernel -m 512M
```

## File Locations

```
systems/
├── glyph_compiler/           # Phase 1: Glyph → SPIR-V
│   └── src/
│       ├── spirv_mapping.rs  # Opcode → SPIR-V mapping
│       └── binary_builder.rs # SPIR-V binary generation
│
├── infinite_map_rs/
│   └── src/backend/
│       ├── drm/              # Phase 2: DRM/KMS
│       │   ├── intel/        # Intel i915
│       │   ├── amdgpu/       # AMD PM4
│       │   └── dmabuf.rs     # Zero-copy
│       └── kernel/           # Phase 3: Kernel interface
│
kernel/
├── geometry_os/              # Phase 3: Linux kernel module
│   ├── main.c
│   └── geometry_os_uapi.h
│
└── geos/                     # Phase 4: Bare metal
    ├── entry.S
    ├── main.c
    └── amdgpu.c

bootloader/
└── efi/
    └── boot.c                # UEFI bootloader
```

## Glyph Opcodes

| Range | Category | Examples |
|-------|----------|----------|
| 200-203 | Arithmetic | ADD, SUB, MUL, DIV |
| 204-207 | Logic | AND, OR, XOR, NOT |
| 208-211 | Memory | LOAD, STORE, LOAD4, STORE4 |
| 212-215 | Control | HALT, JMP, JZ, CALL |
| 216-219 | Comparison | EQ, LT, GT, LE |
| 220-223 | Math | SIN, COS, SQRT, POW |
| 224-227 | Special | INPUT, OUTPUT, NOISE, TIME |

## Hardware Support

| Vendor | Phase 2 | Phase 3 | Phase 4 |
|--------|---------|---------|---------|
| Intel i915 | ✅ | ✅ | ✅ |
| AMD GPU | ✅ | ✅ | ✅ |
| NVIDIA | 🔧 | 🔧 | 🔧 |

## Architecture Vision

> The screen IS the CPU. Every glyph is executable.
> Every font is a program. Geometry OS lives on the GPU.

```
┌─────────────────────────────────────────────────────────┐
│                    Visual Shell                          │
│         (PixiJS infinite desktop - Phase 6)             │
└─────────────────────────────────────────────────────────┘
                          ▲
                          │ DMA-BUF (zero-copy)
                          │
┌─────────────────────────────────────────────────────────┐
│                   Spatial Coordinator                    │
│         (GPU-first windowing - 150 tests)               │
└─────────────────────────────────────────────────────────┘
                          ▲
                          │ Glyph Programs
                          │
┌─────────────────────────────────────────────────────────┐
│                    Glyph Stratum                         │
│         (Executable glyphs - Phase 1-4)                 │
└─────────────────────────────────────────────────────────┘
                          ▲
                          │ MMIO
                          │
┌─────────────────────────────────────────────────────────┐
│                      GPU Hardware                        │
│         (AMD/Intel compute engines)                     │
└─────────────────────────────────────────────────────────┘
```

---

*Last updated: 2026-03-13*
*All 4 phases scaffolded and compiling*
