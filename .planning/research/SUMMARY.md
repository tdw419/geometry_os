# Project Research Summary: GPU Linux Execution

**Project:** PixelRTS Boot Improvement - v1.4 GPU Linux Execution
**Domain:** WebGPU-based RISC-V emulation for Linux kernel boot
**Researched:** 2026-02-28
**Confidence:** MEDIUM-HIGH

## Executive Summary

GPU Linux execution via WebGPU compute shaders represents a genuinely novel approach to browser-based OS emulation. Unlike traditional WebAssembly emulators, this system runs the entire RISC-V instruction loop on GPU hardware, enabling massive parallelism and unique visual debugging capabilities. The existing codebase already contains 2000+ lines of working WGSL RISC-V execution code, making v1.4 primarily an integration and optimization effort rather than new technology adoption.

**The recommended approach** is incremental: start with RV32I base instructions and simple kernel boot, then layer in privileged architecture (M-mode/S-mode), MMU with Sv32, and finally UART console output. The critical decision is whether to build an RV32 Alpine kernel (recommended for v1.4 scope) or extend the existing shader to RV64 to match the pre-built Alpine RISC-V images.

**Key risks** center on GPU-CPU synchronization: WebGPU is a stateless API, and improper buffer mapping will cause state corruption between dispatches. The SBI bridge (kernel-to-JS communication) is particularly vulnerable to race conditions that can cause apparent hangs with no error messages. Prevention requires strict async readback patterns and careful flag management.

---

## Key Findings

### Recommended Stack

**No new core dependencies needed.** The existing stack (wgpu 0.19, WebGPU API, PixiJS v7, bytemuck 1.25) already provides all necessary capabilities. The v1.4 milestone is about scaling and integrating existing components, not adopting new technologies.

**Core technologies:**
- **WebGPU Compute Shaders (WGSL):** RISC-V instruction execution - already 2000+ lines implemented in `riscv_executor.wgsl` and `riscv_linux_vm.wgsl`
- **Storage Buffers (128MB+):** Linux kernel + initrd memory - WebGPU 2025 supports up to 2GB on desktop GPUs
- **Subgroup Operations:** Parallel execution acceleration - 4-8x speedup potential for instruction dispatch
- **SBI Bridge Protocol:** Kernel-to-JS communication - partially implemented, needs JS-side handler completion

**Key decision required:** RV32 vs RV64
- Existing shader: RV32IMA
- Pre-built Alpine kernels: RV64
- **Recommendation:** Build minimal RV32 Alpine kernel for v1.4 (medium effort, low risk)

### Expected Features

**Must have (table stakes):**
- **RISC-V RV32IMA instruction set** - 47 base instructions + atomic extension for Linux kernel
- **MMU with Sv32 support** - Page table walking, VA-to-PA translation (already in `riscv_linux_vm.wgsl`)
- **64MB+ addressable memory** - GPU buffer-backed RAM (128MB currently allocated)
- **M-mode and S-mode** - Privilege level switching, CSR access control
- **UART 16550 console** - Kernel message output (implemented, needs JS bridge)
- **SBI (Supervisor Binary Interface)** - Timer, console, reset system calls

**Should have (differentiators):**
- **True parallel execution** - 64+ cores via WebGPU workgroups
- **Visual program inspection** - Pixels = instructions, visual debugging
- **Zero-copy texture sampling** - No CPU round-trips for instruction fetch
- **Browser-native execution** - No installation required

**Defer (v2+):**
- **PLIC interrupt controller** - Only needed for devices beyond UART
- **VirtIO network** - Not needed for local boot
- **SMP multi-core** - Significant coordination complexity
- **Graphics framebuffer** - Console-only initially
- **RV64 / Floating-point** - Not needed for kernel boot

### Architecture Approach

**Note:** Architecture research failed (rate limit). This section is inferred from STACK.md and FEATURES.md context.

The system follows a layered architecture with GPU-side execution and JS-side orchestration:

**Major components:**
1. **GPUExecutionSystem (TypeScript)** - WebGPU pipeline setup, buffer management, dispatch orchestration
2. **WGSL RISC-V Executor** - Instruction fetch, decode, execute loop running entirely on GPU
3. **Memory Subsystem** - Storage buffers for RAM (128MB), registers (32 GPRs + CSRs), page tables
4. **SBI Bridge** - GPU-JS communication via flagged memory addresses for syscalls
5. **HolographicRISCVBridge.js** - Kernel loading from `.lnx.png` format, state readback

**Data flow:**
```
[LNX Bundle] -> [GPU Buffers] -> [WGSL Executor] -> [SBI Bridge] -> [JS Handler] -> [Console]
```

### Critical Pitfalls

1. **Dispatch Boundary State Loss** - GPU state appears corrupted between dispatches because `mapAsync()` wasn't awaited before reading. Prevention: Always await buffer mapping before accessing staged data.

2. **UART/SBI Bridge Race Condition** - GPU sets flag, waits for JS, but if flag isn't cleared before next dispatch, shader executes 0 instructions. Prevention: Clear flag BEFORE resuming GPU, then write return values.

3. **Page Table Walk Infinite Loop** - MMU walker can follow circular PTE references, hanging the GPU. Prevention: Add depth limit (MAX_WALK_DEPTH = 4) to page table walker.

4. **PC Indexing Confusion** - Shader stores PC as instruction index (word address) but Linux expects byte addresses. Prevention: Document convention clearly, multiply by 4 consistently at translation boundaries.

5. **Storage Buffer Size Assumptions** - Code assumes 128MB but `maxStorageBufferBindingSize` varies by device. Prevention: Check adapter limits before buffer creation, fail gracefully on insufficient GPUs.

---

## Implications for Roadmap

Based on research, suggested phase structure:

### Phase 1: Core Execution Foundation
**Rationale:** Must establish reliable GPU-CPU state sync before any higher-level features. The dispatch boundary state loss pitfall will block all other work.
**Delivers:** Working RV32I instruction execution with verified state readback
**Addresses:** RISC-V base instructions, memory operations, arithmetic
**Avoids:** Pitfall #1 (Dispatch Boundary State Loss), Pitfall #5 (PC Indexing Confusion)
**Research flag:** Standard patterns - existing shader code provides implementation reference

### Phase 2: Privileged Architecture
**Rationale:** Linux boot requires M-mode -> S-mode transition and CSR access. Must come before MMU which depends on satp CSR.
**Delivers:** M-mode/S-mode switching, CSR register access, basic trap handling
**Addresses:** Privileged architecture (table stakes), SBI bridge foundation
**Avoids:** Pitfall #8 (Timer Interrupt Firing in Wrong Mode)
**Research flag:** Needs research - RISC-V trap handling has subtle edge cases

### Phase 3: Memory Management Unit
**Rationale:** Linux requires virtual memory. Page tables depend on CSR setup from Phase 2.
**Delivers:** Sv32 page table walking, VA-to-PA translation, page fault handling
**Addresses:** MMU with Sv32 support (table stakes)
**Avoids:** Pitfall #4 (Page Table Walk Infinite Loop), Pitfall #2 (Weak Memory Consistency)
**Research flag:** Standard patterns - shader already implements MMU, needs testing

### Phase 4: I/O Subsystem (UART + SBI)
**Rationale:** Console output is essential for observing boot progress. SBI bridge enables kernel-to-JS communication.
**Delivers:** UART 16550 emulation, SBI syscall handling (timer, console, reset)
**Addresses:** UART console, SBI interface (table stakes)
**Avoids:** Pitfall #3 (SBI Bridge Race Condition), Pitfall #11 (Console Output Buffer Overflow)
**Research flag:** Needs research - GPU-JS async coordination patterns

### Phase 5: Linux Boot Integration
**Rationale:** Bringing together all components for actual kernel boot. Requires RV32 Alpine kernel build decision.
**Delivers:** Boot to Alpine Linux shell prompt via initramfs
**Addresses:** LNX bundle loading, DTB setup, initramfs boot
**Avoids:** Pitfall #12 (Float-to-Int Conversion), Pitfall #13 (DTB Alignment)
**Research flag:** Needs research - Alpine RV32 kernel build process

### Phase 6: Performance Optimization
**Rationale:** Once working, optimize for throughput. Parallel execution is a key differentiator.
**Delivers:** Batch instruction dispatch, workgroup utilization, cycle counter
**Addresses:** True parallel execution (differentiator), GPU memory bandwidth
**Avoids:** Pitfall #6 (Workgroup Size Mismatch)
**Research flag:** Standard patterns - WebGPU optimization is well-documented

### Phase Ordering Rationale

- **Dependencies drive order:** Core execution -> Privileged mode -> MMU -> I/O -> Integration -> Optimization
- **Observability early:** UART console in Phase 4 enables debugging of Phase 5+ issues
- **Risk reduction:** Phase 1-3 validate GPU execution model before complex kernel boot
- **Incremental value:** Each phase produces testable artifacts

### Research Flags

**Phases likely needing deeper research during planning:**
- **Phase 2:** RISC-V trap handling edge cases (exception priorities, nested traps)
- **Phase 4:** GPU-JS async coordination patterns (SBI bridge design)
- **Phase 5:** Alpine RV32 kernel build process (cross-compilation toolchain)

**Phases with standard patterns (skip research-phase):**
- **Phase 1:** Existing shader code provides complete implementation reference
- **Phase 3:** MMU already implemented in `riscv_linux_vm.wgsl`, needs testing only
- **Phase 6:** WebGPU optimization is well-documented, established patterns exist

---

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | Based on existing codebase analysis (2000+ lines WGSL), stable WebGPU browser support |
| Features | HIGH | Based on RISC-V spec and existing implementation in shaders |
| Architecture | MEDIUM | Architecture research failed (rate limit); inferred from STACK.md and FEATURES.md |
| Pitfalls | HIGH | Based on WebGPU spec, codebase analysis, and GPU programming best practices |

**Overall confidence:** MEDIUM-HIGH

### Gaps to Address

- **RV32 vs RV64 decision:** Need to either build RV32 Alpine kernel or extend shader to RV64. Recommend deciding in Phase 0 before execution begins.
- **Architecture patterns:** Architecture research failed due to rate limit. May need manual research during Phase 0 to validate component boundaries.
- **Device limits testing:** WebGPU `maxStorageBufferBindingSize` varies by device. Need fallback strategy for low-end GPUs.
- **SBI call completeness:** Which SBI calls does Alpine actually use? Need to trace kernel boot to identify required subset.

---

## Sources

### Primary (HIGH confidence)
- **Existing codebase:** `systems/visual_shell/web/shaders/riscv_executor.wgsl` (1100+ lines), `riscv_linux_vm.wgsl` (1800+ lines)
- **W3C WebGPU Specification** - https://www.w3.org/TR/webgpu/ (stable Dec 2024)
- **RISC-V Privileged Architecture v1.12** - https://riscv.org/technical/specifications/

### Secondary (MEDIUM confidence)
- **MDN WebGPU API** - Browser support matrix (Chrome 113+, Safari 26+, Firefox 141+)
- **Chrome Developers - WebGL to WebGPU** - Async model, command batching patterns
- **GPU Memory Consistency - SIGARCH** - Weak memory model testing

### Tertiary (LOW confidence)
- **RISC-V Linux Boot Analysis** (blog.csdn.net) - MMU enablement challenges
- **Unity WebGPU Limitations** - Barrier restrictions, compute limitations

---

## Files Synthesized

| File | Purpose |
|------|---------|
| `.planning/research/STACK.md` | Technology stack with version requirements |
| `.planning/research/FEATURES.md` | Feature landscape with table stakes, differentiators, anti-features |
| `.planning/research/PITFALLS.md` | Domain pitfalls with prevention strategies |
| `.planning/research/SUMMARY.md` | This file - executive summary with roadmap implications |

---
*Research completed: 2026-02-28*
*Architecture research failed (rate limit) - inferred from context*
*Ready for roadmap: yes*
