# Tectonic Hypervisor Architecture

## Overview
The Tectonic Hypervisor is the subsystem of Geometry OS responsible for executing legacy, foreign, and native operating systems (and their software) directly on the WebGPU compute substrate. It achieves this not through traditional CPU virtualization, but through **Morphological Transmutation** and **Spatial Memory Management**.

"Tectonic" refers to the management of multiple operating systems as shifting, independent "plates" (textures) upon the Infinite Map.

## Core Concepts

### 1. The Spatial MMU (The Arbiter)
All memory in Geometry OS is represented as a 2D texture. The Spatial MMU (implemented within `visual_cpu_riscv.wgsl`) is responsible for mapping a Guest OS's linear virtual address space into 2D physical pixel coordinates.

*   **Hilbert-Ordered Quads:** To preserve spatial locality for the GPU texture cache, linear memory regions are mapped using a Hilbert curve rather than simple linear wrapping.
*   **Privilege Rings:**
    *   `Ring 0 (Hypervisor)`: Full access to the Infinite Map texture. Manages allocation and transmutation.
    *   `Ring 1 (Supervisor)`: Guest OS kernels. Restricted to their allocated Hilbert region and specific shared MMIO/Event Pixel regions.
    *   `Ring 2 (User)`: Guest applications. Restricted by the Guest OS's own internal page tables (Sv32).

### 2. The Geometry Font (GeoASM)
The native instruction set executed by the GPU compute shader is represented visually using the Universal Morphological Font. When foreign software is executed, the ultimate goal is to translate it into this font.

### 3. Tiered Morphological Transmutation (The Assimilator)
To run legacy code (x86, ARM) at high speed, Geometry OS employs a tiered translation strategy, managed by Neural Transpiler Daemons.

*   **Tier 0: Native GeoASM:** Direct execution of Geometry Font textures. No translation required.
*   **Tier 1: AOT Transmutation (Static):** When a known binary (`.exe`, `.elf`) is dropped onto the map, it is analyzed and converted entirely into a static `.rts.png` texture containing GeoASM.
*   **Tier 2: JIT Transmutation (Dynamic):** For code discovered at runtime, hot paths are dynamically transmuted and stored in a designated "Geometry Cache" texture region on the GPU.
*   **Tier 3: Emulated Fallback (Interpretive):** For deeply complex, obfuscated, or poorly-behaved legacy code, execution falls back to interpreting the foreign instruction set, using the "Spatial Interrupt Controller."

### 4. Hybrid Hardware Hooks (Path 2c)
When transmuting code (Tiers 1 & 2), hardware side-effects (interrupts, I/O ports) are handled via a hybrid approach:
*   **Native Hooks:** Known idioms (e.g., Linux `INT 0x80`, standard network calls) are translated directly into optimized Geometry Font primitives (`GEOMETRY_SYSCALL`).
*   **Emulated Event Pixels:** Unknown or complex side-effects (e.g., legacy VGA manipulation, obscure PCI config writes) are translated into write operations against specific "Event Pixels" in a shared MMIO texture region. The Hypervisor monitors these pixels and handles the emulation logic.

### 5. Cache Invalidation via Spatial Traps
The Spatial MMU enforces the Tiered Transmutation system. If a Guest OS attempts to write to a memory page that has been transmuted (Tier 1 or Tier 2), the MMU traps the write operation. The Hypervisor invalidates that region in the Geometry Cache and demotes execution of that block back to Tier 3 (Emulation).

## Implementation Roadmap (wgpu-linux-hypervisor-mmu)

The immediate prerequisite for this entire architecture is the implementation of the Spatial MMU. 

**Phase 1 Focus:**
1.  Complete the Sv32 Page Table Walker in `visual_cpu_riscv.wgsl`.
2.  Implement boundary checking to restrict the Walker to the Guest OS's assigned texture region.
3.  Implement privilege mode switching (CSR registers) to distinguish between Ring 0/1/2 access rights.