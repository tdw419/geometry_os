# Phase 18: Privileged Architecture - Research

**Researched:** 2026-02-28
**Domain:** RISC-V Privileged Architecture v1.12, GPU-based emulation
**Confidence:** HIGH

## Summary

This phase implements RISC-V privileged architecture support (M-mode/S-mode) in the existing WebGPU compute shader. The system currently has partial S-mode support (CSRRW only, SRET, basic trap handling) but lacks full M-mode CSRs, complete CSR instruction variants, and proper SBI bridge to JavaScript.

The existing `visual_cpu_riscv.wgsl` (610 lines) already implements:
- S-mode CSRs: satp, stvec, sscratch, sstatus, sepc, scause, stval, sie, sip
- Basic trap handling with trap_enter/trap_ret functions
- SRET instruction (funct7=0x30)
- ECALL/EBREAK with SBI bridge memory region
- Timer interrupt checking

**What needs to be added:**
1. M-mode CSRs: mstatus, mtvec, mepc, mcause, mtval, mscratch, mideleg, medeleg
2. Complete CSR instructions: CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI (only CSRRW exists)
3. MRET instruction for returning from M-mode traps
4. Privilege mode transitions (M<->S with proper CSR state saving)
5. SBI call bridge to JavaScript for console output and system reset

**Primary recommendation:** Extend the existing WGSL shader with M-mode state and implement all CSR instruction variants using the existing funct3 dispatch pattern. Use the SBI_BRIDGE memory region pattern already in place for JavaScript communication.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| WebGPU | 2024+ spec | GPU compute shaders | Project constraint - GPU-only execution |
| WGSL | WebGPU shader language | Shader implementation | Required for WebGPU |
| RISC-V Privileged Spec | v1.12 | CSR definitions, trap behavior | Official specification |

### Existing Implementation (Project-specific)
| Component | File | Purpose |
|-----------|------|---------|
| visual_cpu_riscv.wgsl | systems/visual_shell/web/shaders/ | Main execution shader (610 lines) |
| CoreExecutionVerifier.js | systems/visual_shell/web/ | GPU state readback harness |
| memory.rs | systems/infinite_map_rs/src/riscv/ | Rust CSR struct reference |

### Specification References
| Document | URL | Purpose |
|----------|-----|---------|
| RISC-V Privileged v1.12 | https://riscv.org/technical/specifications/ | Official CSR/trap semantics |
| SBI Specification | https://github.com/riscv-non-isa/riscv-sbi-doc | SBI call interface |

## Architecture Patterns

### Current State Layout (from visual_cpu_riscv.wgsl)
```wgsl
// CSR indices already defined:
const CSR_SATP: u32 = 34u;      // 0x180
const CSR_STVEC: u32 = 35u;     // 0x105
const CSR_SSCRATCH: u32 = 36u;  // 0x140
const CSR_MODE: u32 = 37u;      // Privilege mode (0=user, 1=supervisor)
const CSR_HALT: u32 = 38u;      // Halted flag
const CSR_RESERVATION: u32 = 39u; // LR/SC reservation
const CSR_SEPC: u32 = 40u;      // 0x141
const CSR_SCAUSE: u32 = 41u;    // 0x142
const CSR_STVAL: u32 = 42u;     // 0x143
const CSR_SSTATUS: u32 = 43u;   // 0x100
const CSR_SIE: u32 = 44u;       // 0x104
const CSR_SIP: u32 = 45u;       // 0x144

// Tectonic extensions (46-49)
const CSR_GUEST_BASE: u32 = 46u;
const CSR_GUEST_SIZE: u32 = 47u;
const CSR_GEOM_CACHE_BASE: u32 = 48u;
const CSR_TRANS_FLAGS: u32 = 49u;
```

### Required Additions: M-mode CSRs
```wgsl
// M-mode CSRs to add (indices 50-59)
const CSR_MSTATUS: u32 = 50u;   // 0x300
const CSR_MTVEC: u32 = 51u;     // 0x305
const CSR_MEPC: u32 = 52u;      // 0x341
const CSR_MCAUSE: u32 = 53u;    // 0x342
const CSR_MTVAL: u32 = 54u;     // 0x343
const CSR_MSCRATCH: u32 = 55u;  // 0x340
const CSR_MIDELEG: u32 = 56u;   // 0x303
const CSR_MEDELEG: u32 = 57u;   // 0x302
const CSR_MIE: u32 = 58u;       // 0x304
const CSR_MIP: u32 = 59u;       // 0x344
```

### CSR Instruction Encoding Pattern
```
All CSR instructions use opcode 0x73 (SYSTEM)

I-type format:
[31:20] csr[11:0]  - 12-bit CSR address
[19:15] rs1        - Source register
[14:12] funct3     - Operation type
[11:7]  rd         - Destination register
[6:0]   opcode     - 0x73

funct3 values:
  001 = CSRRW  (Read and Write)
  010 = CSRRS  (Read and Set bits)
  011 = CSRRC  (Read and Clear bits)
  101 = CSRRWI (Read and Write Immediate)
  110 = CSRRSI (Read and Set Immediate)
  111 = CSRRCI (Read and Clear Immediate)
```

### CSR Address Mapping Convention (RISC-V Spec)
```
Bits [11:10]:
  00, 01, 10 = Read/Write
  11 = Read-Only

Bits [9:8] = Minimum privilege:
  00 = U-mode read/write
  01 = S-mode read/write
  10 = H-mode (reserved)
  11 = M-mode read/write
```

### Trap Handling Flow
```
When trap occurs:
1. Save PC to xepc (sepc or mepc based on target mode)
2. Set xcause to trap cause code
3. Set xtval to faulting address (if applicable)
4. Update xstatus:
   - Copy xIE to xPIE
   - Clear xIE (disable interrupts)
   - Save current mode to xPP
5. Set privilege mode to trap handler mode
6. Jump to xtvec

MRET/SRET return:
1. Copy xPIE back to xIE
2. Restore privilege mode from xPP
3. Jump to xepc
```

### Existing Trap Enter Implementation (visual_cpu_riscv.wgsl lines 133-170)
```wgsl
fn trap_enter(base_idx: u32, cause: u32, tval: u32, pc: u32) -> u32 {
    // 1. Save exception PC to SEPC
    cpu_states[base_idx + CSR_SEPC] = pc;

    // 2. Set exception cause
    cpu_states[base_idx + CSR_SCAUSE] = cause;

    // 3. Set trap value (faulting address)
    cpu_states[base_idx + CSR_STVAL] = tval;

    // 4. Update SSTATUS
    let current_mode = cpu_states[base_idx + CSR_MODE];
    let current_sstatus = cpu_states[base_idx + CSR_SSTATUS];
    var new_sstatus = current_sstatus;

    if ((current_sstatus & SSTATUS_SIE) != 0u) {
        new_sstatus = new_sstatus | SSTATUS_SPIE;
    } else {
        new_sstatus = new_sstatus & ~SSTATUS_SPIE;
    }
    new_sstatus = new_sstatus & ~SSTATUS_SIE;

    if (current_mode == 0u) {
        new_sstatus = new_sstatus & ~SSTATUS_SPP;
    } else {
        new_sstatus = new_sstatus | SSTATUS_SPP;
    }
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;

    // 5. Set MODE to supervisor
    cpu_states[base_idx + CSR_MODE] = 1u;

    // 6. Return STVEC as new PC
    return cpu_states[base_idx + CSR_STVEC];
}
```

### SBI Bridge Memory Region (already implemented)
```wgsl
// SBI memory region for JS bridge (lines 79-84)
const SBI_BRIDGE_ADDR: u32 = 0x05010000u;
const SBI_BRIDGE_FLAG: u32 = 0x05010000u;
const SBI_BRIDGE_EID: u32 = 0x05010004u;
const SBI_BRIDGE_FID: u32 = 0x05010008u;
const SBI_BRIDGE_ARGS: u32 = 0x0501000Cu;  // 6 args = 24 bytes
const SBI_BRIDGE_RET: u32 = 0x05010024u;   // 2 returns = 8 bytes
```

### SBI EIDs (Extension IDs) to Support
```wgsl
const SBI_EID_TIMER: u32 = 0x00u;    // Timer extension
const SBI_EID_CONSOLE: u32 = 0x01u;  // Console output (legacy)
const SBI_EID_SRST: u32 = 0x08u;     // System reset
const SBI_EID_BASE: u32 = 0x10u;     // Base extension
```

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| CSR bit field manipulation | Custom bit ops | RISC-V spec bit positions | sstatus/mstatus bits are standardized |
| Trap delegation logic | Custom routing | medeleg/mideleg registers | Spec-defined delegation behavior |
| SBI call interface | Ad-hoc ABI | SBI spec register conventions | a7=EID, a6=FID, a0-a5=args |

**Key insight:** The RISC-V privileged specification is precise about CSR behavior. Follow the spec exactly rather than approximating.

## Common Pitfalls

### Pitfall 1: CSR Index vs CSR Address Confusion
**What goes wrong:** Using CSR addresses (0x300) as array indices
**Why it happens:** CSR addresses look like small integers
**How to avoid:** Always translate CSR address to cpu_states array index via `_get_csr_index()` function
**Warning signs:** CSR reads return wrong values, unexpected trap behavior

### Pitfall 2: SRET in User Mode
**What goes wrong:** Executing SRET when privilege=0 causes illegal instruction
**Why it happens:** SRET is privileged, only works in S-mode or higher
**How to avoid:** Check CSR_MODE >= 1 before executing SRET, trap if not
**Warning signs:** SRET causes trap to fire instead of returning

### Pitfall 3: mstatus vs sstatus Overlap
**What goes wrong:** Reading sstatus returns mstatus bits that shouldn't be visible
**Why it happens:** sstatus is a restricted view of mstatus
**How to avoid:** sstatus reads should mask to only S-mode relevant bits (SIE, SPIE, SPP)
**Warning signs:** Unexpected bits set in sstatus, interrupt enable not working

### Pitfall 4: MRET Not Implemented
**What goes wrong:** System hangs when trying to return from M-mode trap
**Why it happens:** Current shader only has SRET (funct7=0x30), not MRET
**How to avoid:** Implement MRET with encoding 0x30200073, similar to SRET
**Warning signs:** Linux boot hangs at "Switching to M-mode" or similar

### Pitfall 5: CSRRS/CSRRC with rs1=x0
**What goes wrong:** CSRRS with x0 should only read, but implementation writes
**Why it happens:** Forgetting that rs1=x0 means "no write" per spec
**How to avoid:** Check `if (rs1 != 0u)` before writing to CSR in set/clear operations
**Warning signs:** CSR values unexpectedly modified during read operations

### Pitfall 6: Trap Delegation Not Implemented
**What goes wrong:** All traps go to M-mode even when mideleg/medeleg set
**Why it happens:** Shader doesn't check delegation registers
**How to avoid:** Before trap_enter, check medeleg/mideleg to decide S vs M target
**Warning signs:** Linux can't handle its own page faults, boot fails

## Code Examples

### Complete CSR Instruction Dispatch (to add to opcode 0x73)
```wgsl
case 0x73u: { // SYSTEM (ECALL, EBREAK, SRET, MRET, CSR instructions)
    let funct3_sys = (inst >> 12u) & 0x7u;
    let funct7_sys = (inst >> 25u) & 0x7Fu;
    let funct12_sys = (inst >> 20u) & 0xFFFu;
    let csr_addr = inst >> 20u;  // 12-bit CSR address

    // MRET: encoding 0x30200073
    if (funct7_sys == 0x18u && funct3_sys == 0u && funct12_sys == 0x302u) {
        pc = trap_ret_mmode(base_idx);  // Need to implement
        pc_changed = true;
    }
    // SRET: encoding 0x10200073 (already exists)
    else if (funct7_sys == 0x30u) {
        pc = trap_ret(base_idx);
        pc_changed = true;
    }
    // ECALL
    else if (funct3_sys == 0u && funct12_sys == 0x000u) {
        // ... existing ECALL code ...
    }
    // EBREAK
    else if (funct3_sys == 0u && funct12_sys == 0x001u) {
        // ... existing EBREAK code ...
    }
    // CSRRW (funct3=001)
    else if (funct3_sys == 1u) {
        let csr_idx = _get_csr_index(csr_addr);
        if (csr_idx < 255u) {
            let old = cpu_states[base_idx + csr_idx];
            if (rd != 0u) { cpu_states[base_idx + rd] = old; }
            cpu_states[base_idx + csr_idx] = cpu_states[base_idx + rs1];
        }
    }
    // CSRRS (funct3=010) - NEW
    else if (funct3_sys == 2u) {
        let csr_idx = _get_csr_index(csr_addr);
        if (csr_idx < 255u) {
            let old = cpu_states[base_idx + csr_idx];
            if (rd != 0u) { cpu_states[base_idx + rd] = old; }
            if (rs1 != 0u) {  // rs1=x0 means read-only
                cpu_states[base_idx + csr_idx] = old | cpu_states[base_idx + rs1];
            }
        }
    }
    // CSRRC (funct3=011) - NEW
    else if (funct3_sys == 3u) {
        let csr_idx = _get_csr_index(csr_addr);
        if (csr_idx < 255u) {
            let old = cpu_states[base_idx + csr_idx];
            if (rd != 0u) { cpu_states[base_idx + rd] = old; }
            if (rs1 != 0u) {
                cpu_states[base_idx + csr_idx] = old & ~cpu_states[base_idx + rs1];
            }
        }
    }
    // CSRRWI (funct3=101) - NEW
    else if (funct3_sys == 5u) {
        let csr_idx = _get_csr_index(csr_addr);
        let zimm = (inst >> 15u) & 0x1Fu;  // 5-bit zero-extended immediate
        if (csr_idx < 255u) {
            let old = cpu_states[base_idx + csr_idx];
            if (rd != 0u) { cpu_states[base_idx + rd] = old; }
            cpu_states[base_idx + csr_idx] = zimm;
        }
    }
    // CSRRSI (funct3=110) - NEW
    else if (funct3_sys == 6u) {
        let csr_idx = _get_csr_index(csr_addr);
        let zimm = (inst >> 15u) & 0x1Fu;
        if (csr_idx < 255u) {
            let old = cpu_states[base_idx + csr_idx];
            if (rd != 0u) { cpu_states[base_idx + rd] = old; }
            if (zimm != 0u) {
                cpu_states[base_idx + csr_idx] = old | zimm;
            }
        }
    }
    // CSRRCI (funct3=111) - NEW
    else if (funct3_sys == 7u) {
        let csr_idx = _get_csr_index(csr_addr);
        let zimm = (inst >> 15u) & 0x1Fu;
        if (csr_idx < 255u) {
            let old = cpu_states[base_idx + csr_idx];
            if (rd != 0u) { cpu_states[base_idx + rd] = old; }
            if (zimm != 0u) {
                cpu_states[base_idx + csr_idx] = old & ~zimm;
            }
        }
    }
}
```

### Extended _get_csr_index Function
```wgsl
fn _get_csr_index(csr_num: u32) -> u32 {
    switch (csr_num) {
        // S-mode CSRs (existing)
        case 0x180u: { return CSR_SATP; }
        case 0x105u: { return CSR_STVEC; }
        case 0x140u: { return CSR_SSCRATCH; }
        case 0x100u: { return CSR_SSTATUS; }
        case 0x141u: { return CSR_SEPC; }
        case 0x142u: { return CSR_SCAUSE; }
        case 0x143u: { return CSR_STVAL; }
        case 0x104u: { return CSR_SIE; }
        case 0x144u: { return CSR_SIP; }

        // M-mode CSRs (NEW)
        case 0x300u: { return CSR_MSTATUS; }
        case 0x305u: { return CSR_MTVEC; }
        case 0x341u: { return CSR_MEPC; }
        case 0x342u: { return CSR_MCAUSE; }
        case 0x343u: { return CSR_MTVAL; }
        case 0x340u: { return CSR_MSCRATCH; }
        case 0x303u: { return CSR_MIDELEG; }
        case 0x302u: { return CSR_MEDELEG; }
        case 0x304u: { return CSR_MIE; }
        case 0x344u: { return CSR_MIP; }

        default: { return 255u; }
    }
}
```

### MRET Implementation
```wgsl
fn trap_ret_mmode(base_idx: u32) -> u32 {
    let epc = cpu_states[base_idx + CSR_MEPC];
    let mstatus = cpu_states[base_idx + CSR_MSTATUS];

    // MSTATUS bits (RV32)
    const MSTATUS_MIE: u32 = 0x8u;   // Bit 3
    const MSTATUS_MPIE: u32 = 0x80u; // Bit 7
    const MSTATUS_MPP_MASK: u32 = 0x1800u; // Bits 12:11

    let mpie = (mstatus >> 7u) & 1u;
    let mpp = (mstatus >> 11u) & 0x3u;

    var new_mstatus = mstatus;
    // Restore MIE from MPIE
    if (mpie == 1u) {
        new_mstatus = new_mstatus | MSTATUS_MIE;
    } else {
        new_mstatus = new_mstatus & ~MSTATUS_MIE;
    }
    // Set MPIE to 1
    new_mstatus = new_mstatus | MSTATUS_MPIE;
    // Clear MPP (set to U-mode for safety, though spec says preserve)
    new_mstatus = new_mstatus & ~MSTATUS_MPP_MASK;

    cpu_states[base_idx + CSR_MSTATUS] = new_mstatus;

    // Restore privilege mode from MPP
    cpu_states[base_idx + CSR_MODE] = mpp;

    return epc;
}
```

### JavaScript SBI Bridge Handler
```javascript
// In visual shell or bridge code
async function handleSBICall(memoryBuffer, device) {
    // Read SBI bridge region
    const stagingBuffer = device.createBuffer({
        size: 64,
        usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
    });

    const encoder = device.createCommandEncoder();
    encoder.copyBufferToBuffer(memoryBuffer, 0x05010000, stagingBuffer, 0, 64);
    device.queue.submit([encoder.finish()]);

    await stagingBuffer.mapAsync(GPUMapMode.READ);
    const data = new Uint32Array(stagingBuffer.getMappedRange().slice(0));

    const flag = data[0];
    if (flag === 0) return null;

    const eid = data[1];
    const fid = data[2];
    const args = [data[3], data[4], data[5], data[6], data[7], data[8]];

    stagingBuffer.destroy();

    // Handle SBI calls
    let result = { error: 0, value: 0 };

    switch (eid) {
        case 0x01: // Console output (legacy)
            if (fid === 0) { // putchar
                console.log(String.fromCharCode(args[0] & 0xFF));
                result.value = 0;
            }
            break;
        case 0x08: // System reset
            console.log(`SBI: System reset requested, type=${args[0]}, reason=${args[1]}`);
            result.error = 0;
            break;
        case 0x10: // Base extension
            switch (fid) {
                case 0: result.value = 2; break; // sbi_spec_version
                case 1: result.value = 1; break; // sbi_impl_id
                case 2: result.value = 0; break; // sbi_impl_version
            }
            break;
        default:
            result.error = -2; // SBI_ERR_NOT_SUPPORTED
    }

    // Write result back
    const resultData = new Uint32Array([0, result.error, result.value]);
    device.queue.writeBuffer(memoryBuffer, 0x05010000, resultData);

    return result;
}
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| S-mode only | M+S mode support | Phase 18 | Linux boot support |
| CSRRW only | Full CSR instruction set | Phase 18 | Standard compliance |
| Basic trap handling | Full delegation | Phase 18 | OS self-hosted traps |

**Deprecated/outdated:**
- CPU fallback emulation: Project explicitly rejected in REQUIREMENTS.md

## Open Questions

1. **Privilege Mode Initialization**
   - What we know: System boots in M-mode per RISC-V spec
   - What's unclear: Should CSR_MODE default to 3 (M-mode) or 1 (S-mode)?
   - Recommendation: Initialize to 3 (M-mode) at boot, let firmware transition to S-mode

2. **Trap Delegation Priority**
   - What we know: medeleg/mideleg control which traps go to S-mode
   - What's unclear: Should we check delegation before or after trap_enter?
   - Recommendation: Check medeleg/mideleg at trap time to select M vs S handler

3. **SBI Console vs UART**
   - What we know: Both exist (SBI at 0x05010000, UART at 0x05000000)
   - What's unclear: Should both be wired to console.log?
   - Recommendation: Yes, wire both to console.log for maximum compatibility

## Sources

### Primary (HIGH confidence)
- RISC-V Privileged Specification v1.12 - CSR definitions, trap behavior
- GitHub riscv/riscv-isa-manual - Official specification repository
- Existing visual_cpu_riscv.wgsl - Current implementation patterns

### Secondary (MEDIUM confidence)
- WebSearch results verified against RISC-V spec - CSR instruction encodings, SBI interface
- memory.rs CSRBank struct - Reference for Rust implementation

### Tertiary (LOW confidence)
- None - All findings verified against primary sources

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - WebGPU/WGSL are fixed, RISC-V spec is authoritative
- Architecture: HIGH - Existing codebase shows clear patterns to extend
- Pitfalls: HIGH - Based on RISC-V specification and common emulator mistakes

**Research date:** 2026-02-28
**Valid until:** 30 days - RISC-V privileged spec is stable, WebGPU is maturing
