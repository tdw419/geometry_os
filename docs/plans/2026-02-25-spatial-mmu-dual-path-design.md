# Plan: Spatial MMU and Dual-Path Hypervisor Design

**Date:** 2026-02-25
**Status:** Approved Architecture

## 1. Executive Summary
This plan details the implementation of the **Tectonic Hypervisor**, a universal substrate for executing legacy and native software on the Geometry OS GPU compute layer. The architecture uses a **Spatial MMU** to map virtual memory onto 2D textures, and a **Dual-Path Transmutation** strategy (Emulation + JIT) to achieve compatibility and performance.

## 2. Design Decisions

### 2.1 Spatial MMU (The Arbiter)
The MMU is implemented in `visual_cpu_riscv.wgsl` and provides hardware-enforced isolation.
- **State Expansion:** Each CPU core now manages **64 registers** (power-of-2 alignment) to accommodate hypervisor metadata.
- **Tectonic Plates:** Each Guest OS is confined to a spatial "plate" defined by `GUEST_BASE` and `GUEST_SIZE` (texture coordinates).
- **Locality Preservation:** Linear physical addresses are mapped to the 2D texture using a **Morton-order (Z-curve)** to ensure texture cache efficiency.
- **Privilege Rings:**
    - Ring 0: Geometry OS Hypervisor.
    - Ring 1: Guest OS Supervisor (Kernel).
    - Ring 2: Guest OS User (App).

### 2.2 Dual-Path Execution
- **Path 1 (Emulation Bridge):** For maximum compatibility. QEMU runs on the CPU, writing its framebuffer to `/dev/shm`, which is then transposed and uploaded as a texture to the Infinite Map.
- **Path 2 (Neural Transmutation):** For maximum performance. A tiered JIT engine converts foreign binaries (x86/ARM) into native **GeoASM** (Geometry Font) morphological instructions.
    - **Tier 1 (AOT):** Static conversion to `.rts.png`.
    - **Tier 2 (JIT):** Dynamic conversion into a "Geometry Cache" texture.
    - **Tier 3 (Emulation):** Interpretive fallback using "Event Pixels" for complex hardware side-effects.

## 3. Implementation Roadmap

### Phase 1: Spatial MMU Foundation
1. Update `visual_cpu_riscv.wgsl` state layout (64 regs).
2. Implement Sv32 page table walker with Morton-order mapping.
3. Add hardware-enforced boundary checks for `GUEST_BASE/SIZE`.
4. Integrate Dirty/Access bit tracking for JIT triggers.

### Phase 2: Emulation Bridge
1. Build the `/dev/shm` to WebGPU texture bridge.
2. Configure QEMU to use Geometry OS as its primary display substrate.

### Phase 3: Neural Transpiler
1. Implement the x86-to-GeoASM morphological compiler.
2. Implement the JIT demotion trap (Dirty bit on executable page).

## 4. Validation Strategy
- **Privilege Trap Test:** Confirm Ring 2 code cannot access Ring 1 memory.
- **Spatial Isolation Test:** Confirm Guest A cannot read/write Guest B's texture region.
- **Hilbert/Morton Efficiency Test:** Measure performance gain of Z-curve mapping vs linear mapping.
