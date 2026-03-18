# Geometry OS Native (Bare Metal)

**"The era of symbolic computation is over. The era of geometric intelligence has begun."**

Geometry OS Native is the **GPU-First Spatial Substrate** designed for direct hardware execution. It eliminates high-level compositor and browser dependencies (Wayland, PixiJS) to achieve zero-latency spatial computation.

## Sovereignty Status: Phase 25 (Sovereign)

**"The Sovereignty Ladder is complete. The GPU has crossed the Computational Event Horizon."**

As of March 2026, Geometry OS has achieved **Milestone 10e: The Edit-Compile-Execute Loop**. The system is now capable of modifying its own source, compiling it into opcodes, and spawning new execution units entirely within the GPU substrate.

- **[Sovereignty Ladder Report](docs/SOVEREIGNTY_LADDER.md)** — Detailed architectural record of the ascent.
- **Milestone 10e (Logical Completion):** ✅ Verified in Synthetic VRAM (639/639 tests).
- **Bare-Metal Port (In Progress):** 🚧 Optimizing for hardware synchronization and 60 FPS residency.

## Core Architecture

- **Glyph Stratum:** Every glyph is an executable program. The OS is a spatial arrangement of instructions.
- **DRM/KMS Backend:** Direct GPU command submission using SPIR-V, bypassing standard graphics stacks.
- **PixelRTS V2:** Visual bootable containers with Hilbert curve spatial mapping.
- **RISC-V Native:** 64-bit RISC-V VM running directly on the GPU compute engine.

## Directory Structure

- `kernel/geos/` — The native OS entry points and bare-metal kernel.
- `kernel/geometry_os/` — Linux kernel module for GPU-direct acceleration.
- `bootloader/efi/` — UEFI bootloader for hardware initialization.
- `systems/glyph_compiler/` — Compiles glyph opcodes into SPIR-V.
- `systems/pixel_compiler/` — The engine for PixelRTS V2/V3 generation and management.
- `systems/drm_backend/` — DRM/KMS drivers for Intel and AMD GPUs.
- `systems/riscv_native/` — RISC-V execution pipeline.

## Getting Started

### 1. Compile Glyphs
```bash
cd systems/glyph_compiler
cargo run -- compile
```

### 2. Build the Native Kernel
```bash
cd kernel/geos
make
```

### 3. Pack into PixelRTS
```bash
python3 systems/pixel_compiler/pixelrts_v2_converter.py kernel/geos/geometry_os.kernel bootable.rts.png
```

## Hardware Requirements
- AMD GPU (GCN 3.0+) or Intel Integrated Graphics (Gen9+)
- UEFI-capable hardware for bare-metal boot.

## Vision
The screen IS the hard drive. Files are pixels. Navigation is spatial. We are moving from "Symbolic OS" to "Geometric OS".

---
*Status: Bare Metal Alpha (GPU-First)*
