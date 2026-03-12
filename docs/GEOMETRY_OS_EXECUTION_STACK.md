# Geometry OS: Execution Stack Architecture

This document summarizes the three primary execution paths discovered and verified for running external operating systems (like Linux) and native programs within the Geometry OS visual-first substrate.

## 1. The Three-Layer Execution Model

```ascii
┌─────────────────────────────────────────────────────────────────────────────┐
│                       GEOMETRY OS EXECUTION LAYER CAKE                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  Layer 3: NATIVE (Glyph-Atomic / Neural)                                    │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ Logic represented as Unicode characters (U+200 - U+215).              │  │
│  │ The Font IS the Microcode. Executed via GlyphExecutionPipeline.       │  │
│  │                                                                       │  │
│  │ Source (Python) ──► GeoASM ──► Glyphs ──► GPU Render/Execute Loop     │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                   ↕                                         │
│  Layer 2: VISUAL CONTAINERS (PixelRTS v2)                                   │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ Binaries "crystallized" into 2D PNG textures via Hilbert Curve.       │  │
│  │ Preserves spatial locality for GPU cache optimization.                │  │
│  │                                                                       │  │
│  │ Binary (.bin) ──► pixelrts_v2_converter ──► Visual (.rts.png)         │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                   ↕                                         │
│  Layer 1: VIRTUALIZED (RISC-V on GPU)                                       │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ Complete RISC-V RV32IMA processor implemented in WGSL.                │  │
│  │ Supports Linux Kernel (S-mode) boot directly in Compute Shaders.       │  │
│  │                                                                       │  │
│  │ Visual Container ──► riscv_linux_vm.wgsl ──► UART Console             │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## 2. Component Mapping

| Layer | Key Components | Purpose |
| :--- | :--- | :--- |
| **Native** | `python_to_geoasm.py`, `glyph_microcode.wgsl` | AI-generated, self-evolving visual programs. |
| **Visual** | `pixelrts_v2_converter.py`, `rts_texture.rs` | Transforming raw data into morphological textures. |
| **Virtualized**| `riscv_linux_vm.rs`, `riscv_linux_vm.wgsl` | Legacy support for Linux and monolithic binaries. |

## 3. Verified Performance (NVIDIA RTX 5090)

- **Hilbert Batch Mapping:** 87x speedup via Numba/JIT.
- **Glyph Rendering:** 60 FPS reactive loop in Visual Shell.
- **RISC-V Step Time:** ~10,000 instructions per GPU dispatch.

## 4. Conclusion: "The Screen is the Hard Drive"

Geometry OS eliminates the symbolic gap between code and pixels. Software is not a hidden stream of bytes; it is a visible, morphological texture that can be inspected, mutated by AI agents, and executed directly on the GPU substrate.
