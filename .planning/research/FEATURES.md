# Features Research: GPU-Based Linux Execution

**Domain:** GPU compute emulation for Linux kernel execution
**Researched:** 2026-02-28
**Project Context:** Geometry OS - PixelRTS Boot Improvement
**Goal:** Execute Linux kernel entirely on GPU via WebGPU compute shaders

---

## Summary

GPU-based Linux execution means using GPU compute shaders to emulate a RISC-V CPU, which then runs a Linux kernel. This is NOT "Linux running natively on GPU" but rather "GPU emulating the CPU that runs Linux." The approach leverages WebGPU's compute capabilities to implement instruction fetch, decode, execute, memory management, and device emulation in parallel WGSL shaders. The existing codebase already has RV32IMA emulation with MMU support, CSR banks, and MMIO peripherals in WGSL.

---

## Table Stakes (Must Have)

These features are essential for any GPU-based Linux execution system. Missing these means the kernel cannot boot or run.

### Core Emulation

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **RISC-V RV32I Base ISA** | Integer instructions (LUI, AUIPC, JAL, branches, loads, stores, ALU ops) | High | Already implemented in `riscv_executor.wgsl` |
| **Instruction Fetch/Decode** | Read instructions from memory, extract opcode, rd, rs1, rs2, funct3, funct7, immediate | Medium | Already implemented |
| **Register File (x0-x31)** | 32 x 32-bit registers with x0 hardwired to zero | Low | Already implemented |
| **Program Counter** | Track execution address, handle branches/jumps | Low | Already implemented |

### Privileged Architecture (Required for Linux)

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **Privilege Modes** | Machine (M), Supervisor (S), User (U) mode support | High | Required for Linux kernel |
| **CSR Bank** | Control/Status Registers (mstatus, mtvec, sstatus, satp, etc.) | High | Already in `riscv_linux_vm.wgsl` |
| **Trap Handling** | Exception entry/exit, interrupt handling | High | Required for syscalls, page faults |
| **ECALL/EBREAK** | System calls and breakpoints | Medium | Required for Linux syscalls |
| **MRET/SRET** | Return from trap instructions | Medium | Required for exception return |

### Memory Management

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **Sv32 MMU** | Virtual memory with page table walking | Very High | Already partially in `riscv_linux_vm.wgsl` |
| **Page Tables** | 2-level page tables for 32-bit addressing | High | VPN0/VPN1 extraction, PTE parsing |
| **Page Fault Handling** | Detect and report page faults to host | High | Required for demand paging |
| **Physical Memory Map** | RAM at 0x80000000, MMIO regions | Medium | Standard RISC-V layout |

### Device Emulation (MMIO Peripherals)

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **UART 16550** | Console I/O (THR/RBR registers) | Medium | Required for kernel boot messages |
| **CLINT** | Core Local Interruptor (mtime, mtimecmp) | Medium | Required for timer interrupts |
| **PLIC** | Platform Level Interrupt Controller | High | Required for device interrupts |

### Host-GPU Communication

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **Syscall Queue** | GPU->Host syscall requests (write, exit, etc.) | Medium | Already in `riscv_executor.rs` |
| **Console Buffer** | UART output buffer read by host | Low | Already implemented |
| **VM Status** | Running/halted/waiting states | Low | Already implemented |

### Boot Sequence

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **LNX Bundle Format** | Magic + entry point + kernel + initrd + DTB | Low | Already in `LinuxBundleHeader` |
| **Kernel Loading** | Load kernel to RAM_BASE (0x80000000) | Low | Already implemented |
| **Entry Point Jump** | Set PC to kernel entry, start execution | Low | Already implemented |
| **DTB/Initrd Placement** | Load device tree and initrd at correct offsets | Medium | Standard Linux boot protocol |

---

## Differentiators (Competitive Advantage)

Features that set this project apart from other emulation approaches.

### GPU-Native Execution

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **WGSL Compute Shaders** | All CPU emulation runs on GPU | Very High | Core differentiator - no CPU emulation layer |
| **Parallel Instruction Dispatch** | Multiple workgroups execute different instruction batches | High | Already using workgroup parallelism |
| **Texture-as-Memory** | PNG/texture storage for program images | Medium | Unique to Geometry OS ecosystem |
| **Hilbert Memory Layout** | Spatial locality optimization via Hilbert curves | Medium | Already in codebase |

### Performance Optimizations

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **Basic Block Profiler** | Track hot code paths for potential JIT | High | Phase 44 in `riscv_executor.wgsl` |
| **Subgroup Operations** | Use GPU subgroup instructions for atomics | Medium | `riscv_executor_subgroup.wgsl` exists |
| **i64 Emulation Layer** | Software 64-bit ops when GPU lacks native support | Medium | `i64_emulation.rs` generates WGSL |
| **Multi-VM Concurrent Execution** | Run multiple VMs on same GPU (vm_id 0-7) | High | Already in uniforms |

### Integration Features

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **Visual Shell Integration** | VM output rendered as tiles on infinite desktop | Medium | Unique to Geometry OS |
| **ACE-RTS Cognitive BIOS** | Self-healing, evolutionary VM management | High | Geometry OS specific |
| **Real-time Visual Feedback** | Display texture shows execution state | Low | Already implemented |
| **WebSocket API** | Remote control and monitoring | Medium | `api_server.rs` exists |

### RISC-V Extensions

| Feature | Description | Complexity | Notes |
|---------|-------------|------------|-------|
| **RV32M (Multiply/Divide)** | MUL, DIV, REM instructions | Medium | Required for real Linux |
| **RV32A (Atomic)** | LR/SC, AMO instructions | High | Required for SMP Linux |
| **RV32F (Float)** | Single-precision floating point | High | Partially in `riscv_executor.wgsl` |

---

## Anti-Features (Deliberately NOT Building)

Features we explicitly exclude to maintain focus and avoid common pitfalls.

| Anti-Feature | Why Excluded | What to Do Instead |
|--------------|--------------|-------------------|
| **Full x86/ARM Emulation** | Too complex, RISC-V is cleaner target | Stick with RISC-V RV32IMA |
| **GPU Native Linux Kernel** | Requires GPU-capable kernel drivers | Emulate CPU, keep standard kernel |
| **Hardware Acceleration Passthrough** | Security nightmare, complex | Software emulation only |
| **Full GUI/Framebuffer** | Too slow on GPU emulation | Serial console only (UART) |
| **Network Stack in Kernel** | Complex, slow | Host handles networking, proxy to VM |
| **Block Device Persistence** | GPU memory is volatile | Snapshot to PNG, load on restart |
| **JIT Compilation on GPU** | Self-modifying WGSL is not possible | Profile on GPU, JIT hints to host |
| **Multi-core SMP** | Coordination overhead too high for MVP | Single-core emulation |
| **Full 64-bit (RV64)** | Memory requirements double | Stay with RV32, 256MB RAM limit |
| **Real-time Guarantees** | GPU scheduling is nondeterministic | Best-effort execution, not RTOS |

---

## Feature Dependencies

```
Boot Sequence
    |
    v
RISC-V Base ISA (RV32I) ----> Register File
    |                              |
    v                              v
Privileged Architecture ----> CSR Bank
    |                              |
    v                              v
Sv32 MMU <------------------ Trap Handling
    |
    v
MMIO Peripherals (UART, CLINT, PLIC)
    |
    v
Linux Kernel Execution
    |
    v
Syscall Emulation (Host-GPU Bridge)
    |
    v
User Space (Init, Shell)
```

---

## Complexity Summary

| Feature | Complexity | Dependencies | Status |
|---------|------------|--------------|--------|
| RV32I Base ISA | High | None | Implemented |
| RV32M Extension | Medium | RV32I | Implemented |
| RV32A Extension | High | RV32I | Partial |
| RV32F Extension | High | RV32I | Partial |
| Privilege Modes | High | RV32I | Implemented |
| CSR Bank | High | Privilege | Implemented |
| Trap Handling | High | CSR, Privilege | Implemented |
| Sv32 MMU | Very High | CSR, Trap | Implemented |
| UART 16550 | Medium | MMIO | Implemented |
| CLINT Timer | Medium | MMIO | Implemented |
| PLIC Interrupt | High | MMIO | Stub |
| Syscall Queue | Medium | Host Bridge | Implemented |
| Basic Block Profiler | High | Execution Loop | Implemented |
| Multi-VM Support | High | All Core | Implemented |
| LNX Bundle Loading | Low | Memory | Implemented |
| Visual Shell Integration | Medium | Texture Bridge | Partial |

---

## References

### Existing Codebase (HIGH Confidence - Direct Review)

- `systems/infinite_map_rs/src/riscv_executor.rs` - Host-side RISC-V VM management
- `systems/infinite_map_rs/src/shaders/riscv_executor.wgsl` - GPU compute shader for RV32I
- `systems/infinite_map_rs/src/shaders/riscv_linux_vm.wgsl` - Full Linux VM with MMU
- `systems/infinite_map_rs/src/riscv_native/` - Native GPU executor module
- `systems/infinite_map_rs/tests/golden_path_boot_test.rs` - Boot sequence validation

### External Projects (MEDIUM Confidence - Web Research)

- **Vortex (Georgia Tech)** - Open-source RISC-V GPGPU, Apache 2.0
  - https://vortex.cc.gatech.edu/
  - Only 6 new instructions for GPGPU on RISC-V

- **Ventus (Tsinghua)** - RISC-V GPGPU with vector extensions
  - https://OpenGPGPU.org.cn
  - IEEE TVLSI paper (Aug 2025)

- **WebGPU Spec (W3C)** - Compute shader API
  - Candidate Recommendation Dec 2024
  - WebGPU 2.0 expected Q2 2025 with ray tracing

### Technical Approaches (MEDIUM Confidence)

- **GPU-as-CPU-Emulator Pattern**: Use storage buffers for RAM, compute shaders for instruction dispatch
- **Texture-as-Memory**: Encode program data in PNG RGBA channels (4 bytes per pixel)
- **Hilbert Curve Mapping**: Preserve spatial locality in 2D texture representation
- **Syscall Proxy Pattern**: GPU queues syscalls, host processes and returns results

---

## MVP Recommendation

For a working GPU-based Linux boot, prioritize:

1. **Table Stakes Core**: RV32I + Privilege + CSR + Trap Handling (DONE)
2. **Table Stakes MMU**: Sv32 with basic page tables (DONE)
3. **Table Stakes Devices**: UART for console, CLINT for timer (DONE)
4. **Differentiator**: Visual shell integration for boot visualization
5. **Syscall Bridge**: Host handles write/exit, GPU continues execution

Defer to post-MVP:
- **PLIC**: Only needed for complex device interrupts
- **RV32F**: Most Linux kernels don't require FPU
- **JIT**: Profiler exists, JIT compilation requires host involvement
- **Multi-VM**: Works but not critical for first boot

---

## Risk Assessment

| Risk | Severity | Mitigation |
|------|----------|------------|
| GPU Memory Limits | High | Limit RAM to 256MB, use streaming for larger |
| Instruction Throughput | Medium | Batch execution, profiler-guided optimization |
| Page Fault Overhead | Medium | Pre-fault pages, use large pages where possible |
| Syscall Latency | Medium | Batch syscalls, async host processing |
| WGSL Limitations | Medium | Generate emulation code for missing features (i64) |
| Kernel Compatibility | Low | Use standard RISC-V Linux, no special patches |

---

*Research complete. Ready for roadmap phase definition.*
