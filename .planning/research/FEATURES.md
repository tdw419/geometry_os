# Feature Landscape: GPU Linux Execution

**Domain:** GPU-based OS execution via WebGPU compute shaders
**Researched:** 2026-02-28
**Context:** v1.4 milestone - Adding GPU Linux execution to existing PixelRTS boot system

---

## Executive Summary

GPU Linux execution represents a novel approach where the entire OS kernel runs on GPU compute shaders rather than traditional CPU emulation. This research identifies features categorized as table stakes (must have), differentiators (competitive advantage), and anti-features (deliberately avoided).

**Key insight:** GPU-based CPU emulation is an emerging field with limited production examples. Most browser-based RISC-V emulators use WebAssembly, not GPU compute. The Geometry OS approach is genuinely novel.

---

## Table Stakes

Features users expect. Missing = product feels incomplete or broken.

### Core Execution

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **RISC-V RV32IMA instruction set** | Linux kernel requires full ISA support | High | 47 base instructions + atomic extension. Already partially implemented in `riscv_linux_vm.wgsl` |
| **Memory operations (LOAD/STORE)** | All programs need RAM access | Medium | LB, LH, LW, LBU, LHU, SB, SH, SW required |
| **Branch/Jump instructions** | Control flow is fundamental | Medium | JAL, JALR, BEQ, BNE, BLT, BGE, BLTU, BGEU |
| **Arithmetic operations** | Basic computation | Low | ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU |
| **Immediate variants** | Common in compiled code | Low | ADDI, ANDI, ORI, XORI, SLTI, SLTIU, SLLI, SRLI, SRAI |

### Memory Management

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **MMU with Sv32 support** | Linux requires virtual memory | High | Page table walking, VA-to-PA translation. Implemented in `riscv_linux_vm.wgsl` |
| **Page table management** | Process isolation | High | satp CSR, page faults, protection bits |
| **64MB+ addressable memory** | Linux boots need RAM | Medium | GPU buffer-backed RAM. Current: 128MB in `GPUExecutionSystem` |
| **Memory-mapped I/O (MMIO)** | Device access | Medium | Specific address ranges trigger device behavior |

### Privileged Architecture

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **M-mode and S-mode** | Linux uses supervisor mode | High | Privilege level switching, CSR access control |
| **CSR registers** | Required for Linux boot | High | mstatus, satp, stvec, sepc, scause, stval, etc. (~50+ CSRs) |
| **Trap handling** | Exceptions and interrupts | High | ECALL, page faults, illegal instructions |
| **SBI (Supervisor Binary Interface)** | Kernel-to-firmware interface | Medium | System calls for console, reset, etc. |

### Device Emulation

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **UART 16550** | Console output | Medium | Serial port for kernel messages. Implemented in `riscv_linux_vm.wgsl` |
| **CLINT (Timer)** | Timer interrupts | Medium | mtime, mtimecmp registers for scheduling |
| **PLIC (Interrupt Controller)** | External interrupts | High | Interrupt routing, priority, claiming |
| **VirtIO devices** | Block/network console | Very High | virtio-blk for disk, virtio-net for network |

### Boot Process

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **LNX bundle loading** | Existing .rts.png format | Medium | Parse header, extract kernel/initrd/dtb |
| **Kernel entry point** | Start execution at correct address | Low | Typically 0x1000 for LNX format |
| **Device Tree (DTB)** | Hardware description | Medium | Required for Linux to find devices |
| **Initramfs boot** | Boot to userspace | Medium | Mount initrd, execute /init |

---

## Differentiators

Features that set product apart. Not expected, but valued.

### Performance

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **True parallel execution** | 64+ cores running simultaneously | Medium | WebGPU workgroup_size(64) enables massive parallelism |
| **GPU memory bandwidth** | Faster than CPU emulation | Low | GPU VRAM access is faster than system RAM |
| **Zero-copy texture sampling** | No CPU round-trips for instruction fetch | Medium | Sample program directly from texture |
| **Batch instruction dispatch** | 100-1000 cycles per GPU dispatch | Low | Amortize dispatch overhead |

### Unique Capabilities

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **Visual program inspection** | See code as it executes | Medium | Pixels = instructions, visual debugging |
| **Holographic encoding** | Higher information density | High | 1024 instructions per pixel theoretical |
| **Symmetry verification** | Self-validating execution | Medium | Geometric patterns prove correctness |
| **Hot-reload kernels** | Edit and see changes instantly | Medium | Modify texture, GPU picks up changes |

### Integration Advantages

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **Unified visual boot** | Same interface for local/remote/PXE | Low | Consistency with v1.0-v1.3 milestones |
| **Browser-native** | No installation required | Low | WebGPU in Chrome/Edge/Firefox |
| **PixiJS integration** | Visual shell desktop objects | Medium | Drag-and-drop OS boot |
| **Caching resilience** | Offline-capable with IndexedDB | Low | Leverage v1.2 caching infrastructure |

### Developer Experience

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **WGSL shader debugging** | Inspect execution in browser devtools | Low | WebGPU provides debug info |
| **State readback** | Examine registers/memory after execution | Medium | Already implemented via staging buffers |
| **Cycle counter** | Performance profiling | Low | Register 39 in existing implementation |
| **CPU fallback mode** | Debug without GPU | Medium | Already in `HolographicRISCVBridge.js` |

---

## Anti-Features

Features to explicitly NOT build. Common mistakes in this domain.

### Performance Anti-Patterns

| Anti-Feature | Why Avoid | What to Do Instead |
|--------------|-----------|-------------------|
| **Per-instruction dispatch** | GPU dispatch overhead kills performance | Batch 100+ cycles per dispatch |
| **CPU-GPU round-trips per instruction** | Latency destroys throughput | Keep execution on GPU, readback only on halt |
| **Full system emulation** | Scope creep, months of work | Focus on minimal Linux boot first |
| **JIT compilation on GPU** | GPU not suited for dynamic code gen | Pre-compile kernels, static shader dispatch |

### Architecture Anti-Patterns

| Anti-Feature | Why Avoid | What to Do Instead |
|--------------|-----------|-------------------|
| **RV64GC (64-bit compressed)** | Complexity for minimal gain | RV32IMA is sufficient for proof-of-concept |
| **Floating-point (F/D extensions)** | Not needed for kernel boot | Defer to post-v1.4 |
| **Full QEMU parity** | Infinite scope | Target specific Linux configs (Alpine minimal) |
| **Multi-core SMP** | Coordination complexity | Single-core first, parallel cores later |
| **Graphics output (framebuffer)** | Complex VirtIO-GPU | Console output via UART only initially |

### Implementation Anti-Patterns

| Anti-Feature | Why Avoid | What to Do Instead |
|--------------|-----------|-------------------|
| **JavaScript instruction loop** | Defeats purpose of GPU execution | All instruction dispatch in WGSL |
| **WebAssembly emulation** | Standard approach, not novel | WebGPU compute shaders are the innovation |
| **Binary translation** | Complex, error-prone | Direct RISC-V interpretation |
| **Dynamic recompilation** | Not suited for GPU | Static shader dispatch |

---

## Feature Dependencies

```
Boot Loading
    |
    v
LNX Bundle Parse ----> DTB Setup
    |                       |
    v                       v
Kernel Load --------> Memory Init (GPU buffers)
    |                       |
    v                       v
Entry Point ------> RISC-V Core Loop (WGSL)
                        |
                        v
                    Instruction Fetch (texture sample)
                        |
                        v
                    Decode & Execute
                        |
            +-----------+-----------+
            |           |           |
            v           v           v
        ALU Ops    Memory Ops    System Ops
            |           |           |
            v           v           v
        Register    MMU Translate  CSR Access
        Update          |           |
            |           v           v
            |       Page Table   Trap Handler
            |       Walk              |
            |           |             v
            +-----------+--------- SBI Call
                        |
                        v
                    UART Output (console)
```

### Critical Path

1. **Must have first:** RISC-V instruction decode + ALU operations
2. **Then:** Memory operations with identity mapping (no MMU)
3. **Then:** CSR registers and trap handling
4. **Then:** MMU with Sv32 page tables
5. **Then:** UART output for console
6. **Finally:** Full boot to shell prompt

---

## MVP Recommendation

For v1.4 MVP, prioritize:

### Phase 1: Proof of Concept
1. **RV32I base instructions** - Get simple programs running
2. **GPU memory buffers** - 64MB RAM via storage buffers
3. **State readback** - Verify execution via register inspection
4. **Simple kernel boot** - Minimal "hello world" RISC-V kernel

### Phase 2: Linux Boot
5. **Privileged architecture** - M-mode, S-mode, CSRs
6. **Trap handling** - Exceptions, ECALL for SBI
7. **UART console** - Kernel messages visible
8. **MMU Sv32** - Virtual memory support

### Phase 3: Full Linux
9. **CLINT timer** - Timer interrupts
10. **VirtIO block** - Disk access
11. **Initramfs boot** - Boot to Alpine shell

### Defer to Post-v1.4

- **PLIC interrupt controller** - Only needed for devices beyond UART
- **VirtIO network** - Not needed for local boot
- **SMP multi-core** - Significant complexity
- **Graphics framebuffer** - Console-only initially
- **RV64 (64-bit)** - RV32 sufficient for proof-of-concept
- **Floating-point** - Not needed for kernel boot

---

## Comparison: GPU vs Traditional Emulation

| Aspect | GPU (WebGPU) | Traditional (WASM/CPU) |
|--------|--------------|------------------------|
| Parallelism | 64+ cores native | Sequential or limited threads |
| Memory bandwidth | High (VRAM) | Medium (RAM) |
| Latency | Higher dispatch overhead | Lower per-instruction |
| Complexity | Novel, fewer examples | Well-documented patterns |
| Debugging | Harder (GPU black box) | Easier (CPU inspection) |
| Portability | WebGPU browsers only | Universal |
| Innovation | Novel approach | Standard approach |

**Recommendation:** GPU approach for innovation/novelty value and potential parallelism gains. Accept that debugging will be harder and patterns less established.

---

## Sources

- **WebGPU Specification (W3C Candidate Recommendation, Dec 2024)** - https://www.w3.org/TR/webgpu/
- **RISC-V Privileged Architecture v1.12** - https://riscv.org/technical/specifications/
- **Existing implementation:** `systems/visual_shell/web/GPU_NATIVE_RISCV_EXECUTION.md`
- **Existing implementation:** `systems/visual_shell/web/docs/MMU_ARCHITECTURE.md`
- **Existing implementation:** `systems/infinite_map_rs/src/shaders/riscv_linux_vm.wgsl`
- **Existing implementation:** `systems/visual_shell/web/gpu_execution_system.js`
- **Browser emulator reference:** riscv-rust, rvemu (WebAssembly-based RISC-V emulators)

---

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Table stakes (core) | HIGH | Based on RISC-V spec and existing implementation |
| Table stakes (MMU) | HIGH | Already implemented in WGSL shader |
| Table stakes (devices) | MEDIUM | UART/CLINT implemented, VirtIO not yet |
| Differentiators | HIGH | Based on unique GPU approach |
| Anti-features | HIGH | Based on scope management best practices |
| Dependencies | HIGH | Based on boot sequence analysis |

---

*Research complete. Ready for requirements definition.*
