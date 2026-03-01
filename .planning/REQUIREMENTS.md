# Requirements: GPU Linux Execution (v1.4)

**Defined:** 2026-02-28
**Core Value:** Execute Linux kernel entirely on GPU via WebGPU compute shaders

## v1 Requirements

### Core Execution

- [ ] **CORE-01**: System can decode and execute RV32I base instructions (40 instructions)
- [ ] **CORE-02**: System can execute R-type arithmetic operations (ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND)
- [ ] **CORE-03**: System can execute I-type immediate operations (ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI)
- [ ] **CORE-04**: System can execute load instructions (LB, LH, LW, LBU, LHU)
- [ ] **CORE-05**: System can execute store instructions (SB, SH, SW)
- [ ] **CORE-06**: System can execute branch instructions (BEQ, BNE, BLT, BGE, BLTU, BGEU)
- [ ] **CORE-07**: System can execute jump instructions (JAL, JALR)
- [ ] **CORE-08**: System can execute upper immediate instructions (LUI, AUIPC)
- [ ] **CORE-09**: System can execute ECALL and EBREAK instructions

### Memory Management

- [ ] **MEM-01**: System provides 64MB+ addressable memory via GPU storage buffers
- [ ] **MEM-02**: System implements Sv32 page table walking for virtual memory
- [ ] **MEM-03**: System translates virtual addresses to physical addresses via satp CSR
- [ ] **MEM-04**: System handles page faults with appropriate trap delegation
- [ ] **MEM-05**: System supports memory-mapped I/O at device address ranges

### Privileged Architecture

- [ ] **PRIV-01**: System implements M-mode (machine mode) execution
- [ ] **PRIV-02**: System implements S-mode (supervisor mode) execution
- [ ] **PRIV-03**: System implements privilege level switching (M↔S transitions)
- [ ] **PRIV-04**: System implements essential CSRs (mstatus, satp, stvec, sepc, scause, stval, mepc, mcause, mtval)
- [ ] **PRIV-05**: System implements CSR read/write instructions (CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI)
- [ ] **PRIV-06**: System implements trap handling (exceptions and interrupts)
- [ ] **PRIV-07**: System implements MRET and SRET instructions for trap return
- [ ] **PRIV-08**: System implements SBI calls for console output and system reset

### Device Emulation

- [ ] **DEV-01**: System implements UART 16550 compatible serial port
- [ ] **DEV-02**: System routes UART output to JavaScript console
- [ ] **DEV-03**: System implements CLINT timer (mtime, mtimecmp registers)
- [ ] **DEV-04**: System generates timer interrupts based on mtime comparison

### Boot Process

- [ ] **BOOT-01**: System can parse LNX bundle format (header + kernel + initrd + dtb)
- [ ] **BOOT-02**: System can load kernel into GPU memory at correct offset
- [ ] **BOOT-03**: System can load initramfs into GPU memory
- [ ] **BOOT-04**: System can load device tree (DTB) into GPU memory
- [ ] **BOOT-05**: System can start execution at kernel entry point (0x1000)
- [ ] **BOOT-06**: System can boot Alpine Linux to shell prompt via initramfs

### Integration

- [ ] **INT-01**: GPU execution integrates with existing visual shell desktop objects
- [ ] **INT-02**: Boot progress is visualized in the UI
- [ ] **INT-03**: Console output is displayed in visual shell terminal
- [ ] **INT-04**: System provides error handling with actionable guidance

## v2 Requirements

Deferred to future milestones.

### Extended Instruction Sets

- **CORE-10**: RV32A atomic extension (LR, SC, AMO instructions)
- **CORE-11**: RV32M multiply/divide extension (MUL, DIV, REM instructions)
- **CORE-12**: RV32F single-precision floating-point
- **CORE-13**: RV32D double-precision floating-point

### Advanced Devices

- **DEV-05**: PLIC interrupt controller for external interrupts
- **DEV-06**: VirtIO block device for disk access
- **DEV-07**: VirtIO network device for network access
- **DEV-08**: Framebuffer device for graphical output

### Performance

- **PERF-01**: Multi-core SMP execution (2+ harts)
- **PERF-02**: Batch instruction dispatch (100+ cycles per GPU dispatch)
- **PERF-03**: Hot-reload kernels without page refresh

## Out of Scope

| Feature | Reason |
|---------|--------|
| RV64 (64-bit) | RV32 sufficient for proof-of-concept, reduces complexity |
| Full QEMU parity | Infinite scope, target minimal Linux config |
| WebAssembly emulation | Defeats purpose of GPU execution goal |
| Dynamic recompilation | Not suited for GPU execution model |
| CPU fallback mode | Already exists in HolographicRISCVBridge.js |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| CORE-01 | TBD | Pending |
| CORE-02 | TBD | Pending |
| CORE-03 | TBD | Pending |
| CORE-04 | TBD | Pending |
| CORE-05 | TBD | Pending |
| CORE-06 | TBD | Pending |
| CORE-07 | TBD | Pending |
| CORE-08 | TBD | Pending |
| CORE-09 | TBD | Pending |
| MEM-01 | TBD | Pending |
| MEM-02 | TBD | Pending |
| MEM-03 | TBD | Pending |
| MEM-04 | TBD | Pending |
| MEM-05 | TBD | Pending |
| PRIV-01 | TBD | Pending |
| PRIV-02 | TBD | Pending |
| PRIV-03 | TBD | Pending |
| PRIV-04 | TBD | Pending |
| PRIV-05 | TBD | Pending |
| PRIV-06 | TBD | Pending |
| PRIV-07 | TBD | Pending |
| PRIV-08 | TBD | Pending |
| DEV-01 | TBD | Pending |
| DEV-02 | TBD | Pending |
| DEV-03 | TBD | Pending |
| DEV-04 | TBD | Pending |
| BOOT-01 | TBD | Pending |
| BOOT-02 | TBD | Pending |
| BOOT-03 | TBD | Pending |
| BOOT-04 | TBD | Pending |
| BOOT-05 | TBD | Pending |
| BOOT-06 | TBD | Pending |
| INT-01 | TBD | Pending |
| INT-02 | TBD | Pending |
| INT-03 | TBD | Pending |
| INT-04 | TBD | Pending |

**Coverage:**
- v1 requirements: 34 total
- Mapped to phases: 0
- Unmapped: 34 ⚠️

---
*Requirements defined: 2026-02-28*
*Last updated: 2026-02-28 after research synthesis*
