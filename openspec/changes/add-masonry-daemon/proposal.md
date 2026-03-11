# Proposal: Masonry Daemon (Phase 34)

## Context
Phase 33 delivered "Glass RAM" — a real-time Hilbert Curve visualization of system memory. The user identified a critical opportunity: using this visualization to infer functional boundaries (Stack vs Heap vs Code) via entropy analysis.

## The Challenge: Observer Effect
Traditional memory introspection (kernel modules) destabilizes the system it observes ("The Observer Effect"). A "Masonry Daemon" running as a standard CPU process would pollute the very memory patterns it seeks to analyze.

## Objective
Implement the **Masonry Daemon** as a **"Glass-Isolated" Observer**.
Instead of scanning raw memory pointers (CPU), the daemon will scan the **Glass RAM Texture** (GPU).

## Core Concept: "Visual-First Introspection"
1.  **Input**: The `Glass RAM` texture (already generated for display).
2.  **Process**: `masonry_kernel.wgsl` (Compute Shader).
3.  **Algorithm**: Spatial Entropy Analysis on the Hilbert Curve.
    *   High Entropy + Low Variance = Encrypted/Compressed Data.
    *   Medium Entropy + High Repeatability = x86 Code.
    *   Low Entropy = Zeroed/Sparse Memory.
4.  **Stability**: The "Daemon" consumes **zero CPU cycles** for the scan itself, running entirely on the GPU's copy of the state.

## Impact
- **Architecture**: Decouples "Observation" from "Execution".
- **Stability**: Zero risk of kernel panics or deadlock from memory scanning.
- **PAS Score**: Positive (adds "Psychic Weight" without "Structural Load").

## Risks
- **Latency**: GPU readback (Texture -> CPU) for decisions might be slow (PCIe bus).
- **Resolution**: 1px represents 4KB (or similar). Granularity might be too coarse for precise instruction bounds.
