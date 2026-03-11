# CSR Trap Handling Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement complete S-mode trap handling for the RISC-V GPU shader, replacing halt-on-fault with proper exception traps to enable Linux kernel support.

**Architecture:** Add 6 new CSRs (SEPC, SCAUSE, STVAL, SSTATUS, SIE, SIP), implement trap flow that saves state and jumps to STVEC instead of halting, add SRET instruction for trap return, and support all exception types (page faults, ecall, illegal instruction, breakpoint, interrupts).

**Tech Stack:** WGSL (WebGPU Shaders), JavaScript, RISC-V ISA

---

## CSR Layout (Current → New)

| Index | Current | New |
|-------|---------|-----|
| 34 | CSR_SATP | CSR_SATP |
| 35 | CSR_STVEC | CSR_STVEC |
| 36 | CSR_SSCRATCH | CSR_SSCRATCH |
| 37 | CSR_MODE | CSR_MODE |
| 38 | CSR_HALT | CSR_HALT |
| 39 | CSR_RESERVATION | CSR_RESERVATION |
| 40 | - | **CSR_SEPC** (Exception PC) |
| 41 | - | **CSR_SCAUSE** (Exception cause) |
| 42 | - | **CSR_STVAL** (Trap value) |
| 43 | - | **CSR_SSTATUS** (Status: SIE/SPIE/SPP) |
| 44 | - | **CSR_SIE** (Interrupt enable) |
| 45 | - | **CSR_SIP** (Interrupt pending) |

**REGS_PER_CORE:** 40 → 46

---

## Exception Codes (SCAUSE)

| Code | Name | Description |
|------|------|-------------|
| 2 | Illegal instruction | Unknown opcode/encoding |
| 3 | Breakpoint | EBREAK instruction |
| 8 | Ecall from U-mode | System call from user |
| 11 | Ecall from S-mode | System call from supervisor |
| 12 | Instruction page fault | Fetch from invalid page |
| 13 | Load page fault | Read from invalid page |
| 15 | Store/AMO page fault | Write to invalid page |

---

## SSTATUS Register Layout

| Bit | Name | Description |
|-----|------|-------------|
| 0 | SIE | Supervisor interrupt enable |
| 1 | SPIE | Saved SIE (on trap) |
| 8 | SPP | Previous privilege mode |

---

## Task 1: Add New CSR Constants

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl:18-27`
- Modify: `systems/visual_shell/web/gpu_execution_system.js:79-82`

**Step 1: Add new CSR constants in WGSL shader**

Update the CSR section (after line 27):

```wgsl
// --- CSR INDICES (in cpu_states array) ---
const CSR_SATP: u32 = 34u;      // Page table base + mode
const CSR_STVEC: u32 = 35u;     // Trap handler address
const CSR_SSCRATCH: u32 = 36u;  // Scratch register for traps
const CSR_MODE: u32 = 37u;      // Privilege mode (0=user, 1=supervisor)
const CSR_HALT: u32 = 38u;      // Halted flag
const CSR_RESERVATION: u32 = 39u; // Reservation address for LR/SC

// --- NEW: Trap Handling CSRs ---
const CSR_SEPC: u32 = 40u;      // Exception program counter
const CSR_SCAUSE: u32 = 41u;    // Exception cause code
const CSR_STVAL: u32 = 42u;     // Trap value (faulting address)
const CSR_SSTATUS: u32 = 43u;   // Status register (SIE, SPIE, SPP)
const CSR_SIE: u32 = 44u;       // Supervisor interrupt enable
const CSR_SIP: u32 = 45u;       // Supervisor interrupt pending

// SSTATUS bit positions
const SSTATUS_SIE: u32 = 1u;    // Bit 0: Interrupt enable
const SSTATUS_SPIE: u32 = 2u;   // Bit 1: Saved interrupt enable
const SSTATUS_SPP: u32 = 256u;  // Bit 8: Previous privilege mode
```

**Step 2: Update REGS_PER_CORE constant**

Change line 19:
```wgsl
const REGS_PER_CORE: u32 = 46u; // 32 regs + PC + Halt + CSRs (6) + Trap CSRs (6)
```

**Step 3: Update gpu_execution_system.js buffer size**

In `gpu_execution_system.js`, update the state buffer size:

```javascript
// Line 79-81: Update state buffer size
// 3. Create CPU State Buffer (46 u32s: 32 regs + PC + Halt + CSRs + Trap state)
this.stateBuffer = this.device.createBuffer({
    size: 46 * 4,
```

Also update line 325:
```javascript
const stateSize = 46 * 4;
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git add systems/visual_shell/web/gpu_execution_system.js
git commit -m "feat(trap): add trap handling CSR constants

- Add SEPC, SCAUSE, STVAL, SSTATUS, SIE, SIP
- Update REGS_PER_CORE to 46
- Update GPU state buffer size

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Add _get_csr_index Mapping for New CSRs

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl:58-66`

**Step 1: Update _get_csr_index function**

Replace the existing `_get_csr_index` function:

```wgsl
// --- CSR HELPER ---
// Maps CSR number to its index in cpu_states array
// Returns 255u for unknown CSRs (should trap in full implementation)
fn _get_csr_index(csr_num: u32) -> u32 {
    switch (csr_num) {
        case 0x180u: { return CSR_SATP; }      // satp
        case 0x105u: { return CSR_STVEC; }     // stvec
        case 0x140u: { return CSR_SSCRATCH; }  // sscratch
        case 0x100u: { return CSR_SSTATUS; }   // sstatus
        case 0x141u: { return CSR_SEPC; }      // sepc
        case 0x142u: { return CSR_SCAUSE; }    // scause
        case 0x143u: { return CSR_STVAL; }     // stval
        case 0x104u: { return CSR_SIE; }       // sie
        case 0x144u: { return CSR_SIP; }       // sip
        default: { return 255u; }              // Unknown CSR
    }
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): add CSR index mappings for trap handling

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Implement trap_enter Helper Function

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Add trap_enter function after _get_csr_index**

Add after the `_get_csr_index` function (around line 70):

```wgsl
// --- TRAP HANDLING ---
// Exception codes (SCAUSE values)
const CAUSE_ILLEGAL_INST: u32 = 2u;
const CAUSE_BREAKPOINT: u32 = 3u;
const CAUSE_ECALL_U: u32 = 8u;
const CAUSE_ECALL_S: u32 = 11u;
const CAUSE_INST_PAGE_FAULT: u32 = 12u;
const CAUSE_LOAD_PAGE_FAULT: u32 = 13u;
const CAUSE_STORE_PAGE_FAULT: u32 = 15u;

// Enter trap handler
// Saves PC to SEPC, sets SCAUSE/STVAL, updates SSTATUS, jumps to STVEC
fn trap_enter(base_idx: u32, cause: u32, tval: u32, pc: u32) -> u32 {
    // 1. Save exception PC to SEPC
    cpu_states[base_idx + CSR_SEPC] = pc;

    // 2. Set exception cause
    cpu_states[base_idx + CSR_SCAUSE] = cause;

    // 3. Set trap value (faulting address)
    cpu_states[base_idx + CSR_STVAL] = tval;

    // 4. Update SSTATUS:
    //    - Save current MODE to SPP (bit 8)
    //    - Save current SIE to SPIE (bit 1)
    //    - Clear SIE (disable interrupts during trap)
    let current_mode = cpu_states[base_idx + CSR_MODE];
    let current_sstatus = cpu_states[base_idx + CSR_SSTATUS];
    let current_sie = current_sstatus & SSTATUS_SIE;

    var new_sstatus = current_sstatus;
    new_sstatus = new_sstatus | (current_sie << 1u);  // SPIE = SIE
    new_sstatus = new_sstatus & ~SSTATUS_SIE;         // Clear SIE
    if (current_mode == 0u) {
        new_sstatus = new_sstatus & ~SSTATUS_SPP;     // SPP = 0 (from user)
    } else {
        new_sstatus = new_sstatus | SSTATUS_SPP;      // SPP = 1 (from supervisor)
    }
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;

    // 5. Set MODE to supervisor
    cpu_states[base_idx + CSR_MODE] = 1u;

    // 6. Return STVEC as new PC
    let stvec = cpu_states[base_idx + CSR_STVEC];
    return stvec;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): add trap_enter helper function

- Saves PC to SEPC
- Sets SCAUSE and STVAL
- Updates SSTATUS (SPP, SPIE, clears SIE)
- Returns STVEC as new PC

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Implement SRET Instruction

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Add trap_ret helper function**

Add after `trap_enter`:

```wgsl
// Return from trap (SRET instruction)
// Restores PC from SEPC, MODE from SPP, SIE from SPIE
fn trap_ret(base_idx: u32) -> u32 {
    // 1. Get saved PC from SEPC
    let epc = cpu_states[base_idx + CSR_SEPC];

    // 2. Restore SSTATUS:
    //    - SIE = SPIE
    //    - MODE = SPP
    let sstatus = cpu_states[base_idx + CSR_SSTATUS];
    let spie = (sstatus >> 1u) & 1u;  // Get SPIE bit
    let spp = (sstatus >> 8u) & 1u;   // Get SPP bit

    // Set SIE = SPIE, clear SPIE
    var new_sstatus = sstatus;
    if (spie == 1u) {
        new_sstatus = new_sstatus | SSTATUS_SIE;
    } else {
        new_sstatus = new_sstatus & ~SSTATUS_SIE;
    }
    new_sstatus = new_sstatus & ~SSTATUS_SPIE;  // Clear SPIE
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;

    // 3. Restore privilege mode from SPP
    cpu_states[base_idx + CSR_MODE] = spp;

    // 4. Return EPC as new PC
    return epc;
}
```

**Step 2: Add SRET to SYSTEM opcode handler**

In the `case 0x73u:` (SYSTEM) section, add SRET handling. Find the ecall section and add:

```wgsl
case 0x73u: { // SYSTEM (ecall, csrrw, csrrs, sret)
    let funct3_sys = (inst >> 12u) & 0x7u;
    let funct7_sys = (inst >> 25u) & 0x7Fu;

    if (funct7_sys == 0x30u) {
        // SRET - Return from trap
        pc = trap_ret(base_idx);
    } else if (funct3_sys == 0u) {
        // ECALL/EBREAK
        let a7 = cpu_states[base_idx + 17u]; // x17
        if (a7 == 93u) { // exit
            cpu_states[base_idx + CSR_HALT] = 1u;
        }
    } else if (funct3_sys == 1u) {
        // ... existing CSRRW code ...
    }
    // ... rest of existing code ...
}
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): add SRET instruction support

- trap_ret helper restores PC, MODE, SIE
- SRET (funct7=0x30) triggers trap return

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Replace Halt-on-Fault with Trap in LOAD

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Update LOAD handler to trap instead of halt**

Find the LOAD case (around line 312-330). Replace:

```wgsl
case 0x03u: { // LOAD (lw, lb, lbu, lh, lhu)
    let offset = i32(inst) >> 20u;
    let val1 = i32(cpu_states[base_idx + rs1]);
    let vaddr = u32(val1 + offset);

    // Translate virtual to physical
    let paddr = translate_address(vaddr, 0u, base_idx);

    if (paddr == 0xFFFFFFFFu) {
        // Page fault - trap to handler
        pc = trap_enter(base_idx, CAUSE_LOAD_PAGE_FAULT, vaddr, pc);
    } else if (paddr < 67108864u) {
        let word_idx = paddr / 4u;
        let byte_offset = paddr & 3u;
        let mem_val = system_memory[word_idx];

        if (funct3 == 0x2u) { // LW
            if (rd != 0u) { cpu_states[base_idx + rd] = mem_val; }
        } else if (funct3 == 0x0u) { // LB
            let byte_val = (mem_val >> (byte_offset * 8u)) & 0xFFu;
            let sign_ext = (byte_val >> 7u) * 0xFFFFFF00u;
            if (rd != 0u) { cpu_states[base_idx + rd] = byte_val | sign_ext; }
        } else if (funct3 == 0x4u) { // LBU
            let byte_val = (mem_val >> (byte_offset * 8u)) & 0xFFu;
            if (rd != 0u) { cpu_states[base_idx + rd] = byte_val; }
        } else if (funct3 == 0x1u) { // LH
            let half_val = (mem_val >> (byte_offset * 8u)) & 0xFFFFu;
            let sign_ext = (half_val >> 15u) * 0xFFFF0000u;
            if (rd != 0u) { cpu_states[base_idx + rd] = half_val | sign_ext; }
        } else if (funct3 == 0x5u) { // LHU
            let half_val = (mem_val >> (byte_offset * 8u)) & 0xFFFFu;
            if (rd != 0u) { cpu_states[base_idx + rd] = half_val; }
        }
    }
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): replace halt with trap on load page fault

- LOAD handler now traps to STVEC on page fault
- Adds LB, LBU, LH, LHU support

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Replace Halt-on-Fault with Trap in STORE

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Update STORE handler to trap instead of halt**

Find the STORE case (around line 332-355). Replace:

```wgsl
case 0x23u: { // STORE (sw, sb, sh)
    // S-Type immediate construction
    let imm11_5 = (inst >> 25u) & 0x7Fu;
    let imm4_0 = (inst >> 7u) & 0x1Fu;
    let imm_s = (imm11_5 << 5u) | imm4_0;
    // Sign extend 12-bit immediate
    let offset_s = (i32(imm_s) << 20u) >> 20u;

    let val1 = i32(cpu_states[base_idx + rs1]);
    let val2 = cpu_states[base_idx + rs2];
    let vaddr = u32(val1 + offset_s);

    // Translate virtual to physical
    let paddr = translate_address(vaddr, 1u, base_idx);

    if (paddr == 0xFFFFFFFFu) {
        // Page fault - trap to handler
        pc = trap_enter(base_idx, CAUSE_STORE_PAGE_FAULT, vaddr, pc);
    } else if (paddr < 67108864u) {
        let word_idx = paddr / 4u;
        let byte_offset = paddr & 3u;

        if (funct3 == 0x2u) { // SW
            system_memory[word_idx] = val2;
        } else if (funct3 == 0x0u) { // SB
            let shift = byte_offset * 8u;
            let mask = ~(0xFFu << shift);
            let old_val = system_memory[word_idx];
            system_memory[word_idx] = (old_val & mask) | ((val2 & 0xFFu) << shift);
        } else if (funct3 == 0x1u) { // SH
            let shift = byte_offset * 8u;
            let mask = ~(0xFFFFu << shift);
            let old_val = system_memory[word_idx];
            system_memory[word_idx] = (old_val & mask) | ((val2 & 0xFFFFu) << shift);
        }
    }
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): replace halt with trap on store page fault

- STORE handler now traps to STVEC on page fault
- Adds SB, SH support

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 7: Replace Halt-on-Fault with Trap in ATOMIC

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Update ATOMIC handler to trap instead of halt**

Find the ATOMIC case (around line 404). Replace the page fault handling:

```wgsl
case 0x2Fu: { // ATOMIC (A-Extension)
    let funct5 = (inst >> 27u) & 0x1Fu;
    let val1 = i32(cpu_states[base_idx + rs1]);
    let val2 = cpu_states[base_idx + rs2];
    let vaddr = u32(val1);

    // AMOs are Read-Modify-Write, so effectively Write.
    let paddr = translate_address(vaddr, 1u, base_idx);

    if (paddr == 0xFFFFFFFFu) {
        // Page fault - trap to handler
        pc = trap_enter(base_idx, CAUSE_STORE_PAGE_FAULT, vaddr, pc);
    } else if (paddr < 67108864u) {
        let word_idx = paddr / 4u;

        if (funct5 == 0x02u) { // LR.W
            // Load-Reserved
            let loaded = system_memory[word_idx];
            if (rd != 0u) { cpu_states[base_idx + rd] = loaded; }
            cpu_states[base_idx + CSR_RESERVATION] = paddr;
        } else if (funct5 == 0x03u) { // SC.W
            // Store-Conditional
            let reservation = cpu_states[base_idx + CSR_RESERVATION];
            if (reservation == paddr) {
                // Success: write value, return 0
                system_memory[word_idx] = val2;
                cpu_states[base_idx + CSR_RESERVATION] = 0xFFFFFFFFu; // Invalidate
                if (rd != 0u) { cpu_states[base_idx + rd] = 0u; }
            } else {
                // Failure: don't write, return 1
                if (rd != 0u) { cpu_states[base_idx + rd] = 1u; }
            }
        } else {
            // AMOs (Read-Modify-Write)
            let mem_val = system_memory[word_idx];
            let i_mem = i32(mem_val);
            let i_src = i32(val2);
            var result: u32 = mem_val;

            switch (funct5) {
                case 0x01u: { result = val2; } // AMOSWAP
                case 0x00u: { result = u32(i_mem + i_src); } // AMOADD
                case 0x04u: { result = mem_val ^ val2; } // AMOXOR
                case 0x0Cu: { result = mem_val & val2; } // AMOAND
                case 0x08u: { result = mem_val | val2; } // AMOOR
                case 0x10u: { result = u32(min(i_mem, i_src)); } // AMOMIN
                case 0x14u: { result = u32(max(i_mem, i_src)); } // AMOMAX
                case 0x18u: { result = min(mem_val, val2); } // AMOMINU
                case 0x1Cu: { result = max(mem_val, val2); } // AMOMAXU
                default: { result = mem_val; } // Unknown - no op
            }

            system_memory[word_idx] = result;
            if (rd != 0u) { cpu_states[base_idx + rd] = mem_val; }
        }
    }
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): replace halt with trap on atomic page fault

- ATOMIC handler now traps to STVEC on page fault

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 8: Add Illegal Instruction Trap

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Add default case for unknown opcodes**

At the end of the main switch statement (after the last case), add:

```wgsl
default: {
    // Unknown opcode - illegal instruction trap
    pc = trap_enter(base_idx, CAUSE_ILLEGAL_INST, inst, pc);
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): add illegal instruction trap for unknown opcodes

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 9: Add ECALL Trap with Privilege Check

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Update ECALL to trap instead of halt**

In the SYSTEM case (0x73u), update the ECALL handler:

```wgsl
if (funct3_sys == 0u) {
    // ECALL/EBREAK
    let imm = inst >> 20u;
    if (imm == 0u) {
        // ECALL - system call
        let current_mode = cpu_states[base_idx + CSR_MODE];
        let cause = select(CAUSE_ECALL_S, CAUSE_ECALL_U, current_mode == 0u);
        pc = trap_enter(base_idx, cause, 0u, pc);
    } else if (imm == 1u) {
        // EBREAK - breakpoint
        pc = trap_enter(base_idx, CAUSE_BREAKPOINT, pc, pc);
    }
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(trap): add ECALL/EBREAK trap handling

- ECALL traps with U-mode or S-mode cause code
- EBREAK traps with breakpoint cause

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 10: Update readState in gpu_execution_system.js

**Files:**
- Modify: `systems/visual_shell/web/gpu_execution_system.js`

**Step 1: Update readState to include new CSRs**

Update the readState method (around line 280-290):

```javascript
async readState(id) {
    const kernel = this.kernels.get(id);
    if (!kernel) return null;

    const stateSize = 46 * 4;
    const stagingBuffer = this.device.createBuffer({
        size: stateSize,
        usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
    });

    const commandEncoder = this.device.createCommandEncoder();
    commandEncoder.copyBufferToBuffer(kernel.stateBuffer, 0, stagingBuffer, 0, stateSize);
    this.device.queue.submit([commandEncoder.finish()]);

    await stagingBuffer.mapAsync(GPUMapMode.READ);
    const states = new Uint32Array(stagingBuffer.getMappedRange().slice());
    stagingBuffer.unmap();

    return {
        registers: Array.from(states.slice(0, 32)),
        pc: states[32],
        halted: states[38] > 0,
        satp: states[34],
        stvec: states[35],
        sscratch: states[36],
        mode: states[37],
        // New trap CSRs
        sepc: states[40],
        scause: states[41],
        stval: states[42],
        sstatus: states[43],
        sie: states[44],
        sip: states[45]
    };
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/gpu_execution_system.js
git commit -m "feat(trap): expose trap CSRs in readState

- Add SEPC, SCAUSE, STVAL, SSTATUS, SIE, SIP to state output

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 11: Create Trap Handling Test Page

**Files:**
- Create: `systems/visual_shell/web/test_trap_handling.html`

**Step 1: Create test page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trap Handling Test Page</title>
    <style>
        body {
            font-family: monospace;
            background: #1a1a2e;
            color: #eee;
            padding: 20px;
        }
        .container { max-width: 1000px; margin: 0 auto; }
        h1 { color: #4CAF50; }
        .section {
            background: #16213e;
            border: 1px solid #0f3460;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
        }
        button {
            background: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin: 5px;
        }
        button:hover { background: #45a049; }
        .output {
            background: #0f0f23;
            border: 1px solid #0f3460;
            padding: 10px;
            margin-top: 10px;
            white-space: pre-wrap;
            font-size: 12px;
            max-height: 300px;
            overflow-y: auto;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #0f3460;
            padding: 8px;
            text-align: left;
        }
        th { background: #0f3460; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🪤 Trap Handling Test Page</h1>

        <div class="section">
            <h2>1. Hypervisor Status</h2>
            <button onclick="checkHypervisor()">Check Status</button>
            <div id="statusOutput" class="output">Click to check...</div>
        </div>

        <div class="section">
            <h2>2. CSR Registers</h2>
            <button onclick="readCSRs()">Read Trap CSRs</button>
            <div id="csrOutput" class="output">Click to read CSRs...</div>
        </div>

        <div class="section">
            <h2>3. Trap Test: Page Fault</h2>
            <p>Attempt to access invalid address to trigger page fault trap</p>
            <button onclick="triggerPageFault()">Trigger Page Fault</button>
            <div id="faultOutput" class="output">Click to trigger...</div>
        </div>

        <div class="section">
            <h2>4. Trap Test: ECALL</h2>
            <p>Execute ECALL to trigger system call trap</p>
            <button onclick="triggerEcall()">Trigger ECALL</button>
            <div id="ecallOutput" class="output">Click to trigger...</div>
        </div>

        <div class="section">
            <h2>5. Trap Test: Illegal Instruction</h2>
            <p>Execute unknown opcode to trigger illegal instruction trap</p>
            <button onclick="triggerIllegal()">Trigger Illegal Instruction</button>
            <div id="illegalOutput" class="output">Click to trigger...</div>
        </div>
    </div>

    <script>
        async function checkHypervisor() {
            const output = document.getElementById('statusOutput');
            if (!window.hypervisorSystem) {
                output.textContent = '❌ Hypervisor not running';
                return;
            }
            const state = await window.hypervisorSystem.readState('main_cpu');
            if (state) {
                output.textContent = `✅ Hypervisor Running\n\n` +
                    `PC: 0x${state.pc.toString(16).padStart(8, '0')}\n` +
                    `Halted: ${state.halted}\n` +
                    `Mode: ${state.mode === 0 ? 'User' : 'Supervisor'}\n` +
                    `STVEC: 0x${(state.stvec || 0).toString(16).padStart(8, '0')}`;
            }
        }

        async function readCSRs() {
            const output = document.getElementById('csrOutput');
            if (!window.hypervisorSystem) {
                output.textContent = '❌ Hypervisor not running';
                return;
            }
            const state = await window.hypervisorSystem.readState('main_cpu');
            if (state) {
                const causeNames = {
                    2: 'Illegal instruction',
                    3: 'Breakpoint',
                    8: 'Ecall from U-mode',
                    11: 'Ecall from S-mode',
                    12: 'Instruction page fault',
                    13: 'Load page fault',
                    15: 'Store/AMO page fault'
                };
                const causeName = causeNames[state.scause] || `Unknown (${state.scause})`;

                output.textContent = `Trap CSRs:\n\n` +
                    `SEPC:    0x${(state.sepc || 0).toString(16).padStart(8, '0')}\n` +
                    `SCAUSE:  ${state.scause} (${causeName})\n` +
                    `STVAL:   0x${(state.stval || 0).toString(16).padStart(8, '0')}\n` +
                    `SSTATUS: 0x${(state.sstatus || 0).toString(16).padStart(8, '0')}\n` +
                    `  SIE:   ${(state.sstatus || 0) & 1 ? 'Enabled' : 'Disabled'}\n` +
                    `  SPIE:  ${((state.sstatus || 0) >> 1) & 1 ? 'Was enabled' : 'Was disabled'}\n` +
                    `  SPP:   ${((state.sstatus || 0) >> 8) & 1 ? 'Supervisor' : 'User'}\n` +
                    `SIE:     0x${(state.sie || 0).toString(16).padStart(8, '0')}\n` +
                    `SIP:     0x${(state.sip || 0).toString(16).padStart(8, '0')}`;
            }
        }

        async function triggerPageFault() {
            const output = document.getElementById('faultOutput');
            output.textContent = '⚠️ Manual test required:\n\n' +
                '1. Load a program that accesses address 0xDEADBEEF\n' +
                '2. Observe SCAUSE = 13 (Load page fault) or 15 (Store page fault)\n' +
                '3. STVAL should contain 0xDEADBEEF\n' +
                '4. PC should jump to STVEC handler';
        }

        async function triggerEcall() {
            const output = document.getElementById('ecallOutput');
            output.textContent = '⚠️ Manual test required:\n\n' +
                '1. Load a program with ECALL instruction (0x00000073)\n' +
                '2. Observe SCAUSE = 8 (U-mode) or 11 (S-mode)\n' +
                '3. SEPC should contain ECALL address\n' +
                '4. PC should jump to STVEC handler';
        }

        async function triggerIllegal() {
            const output = document.getElementById('illegalOutput');
            output.textContent = '⚠️ Manual test required:\n\n' +
                '1. Load a program with unknown opcode (e.g., 0xFFFFFFFF)\n' +
                '2. Observe SCAUSE = 2 (Illegal instruction)\n' +
                '3. STVAL should contain the instruction\n' +
                '4. PC should jump to STVEC handler';
        }
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_trap_handling.html
git commit -m "feat(trap): add trap handling test page

- CSR register display
- Test instructions for page fault, ecall, illegal instruction

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Add CSR constants | `visual_cpu_riscv.wgsl`, `gpu_execution_system.js` |
| 2 | Add CSR index mappings | `visual_cpu_riscv.wgsl` |
| 3 | Implement trap_enter | `visual_cpu_riscv.wgsl` |
| 4 | Implement SRET | `visual_cpu_riscv.wgsl` |
| 5 | LOAD page fault trap | `visual_cpu_riscv.wgsl` |
| 6 | STORE page fault trap | `visual_cpu_riscv.wgsl` |
| 7 | ATOMIC page fault trap | `visual_cpu_riscv.wgsl` |
| 8 | Illegal instruction trap | `visual_cpu_riscv.wgsl` |
| 9 | ECALL/EBREAK trap | `visual_cpu_riscv.wgsl` |
| 10 | Update readState | `gpu_execution_system.js` |
| 11 | Create test page | `test_trap_handling.html` |

---

## Architecture Summary

```
┌─────────────────────────────────────────────────────────────┐
│                    Exception Occurs                          │
│                  (page fault, ecall, etc)                    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     trap_enter()                             │
│  1. SEPC ← PC (save return address)                          │
│  2. SCAUSE ← exception code                                  │
│  3. STVAL ← faulting address/instruction                     │
│  4. SSTATUS.SPP ← MODE (save privilege)                      │
│  5. SSTATUS.SPIE ← SSTATUS.SIE (save interrupt state)        │
│  6. SSTATUS.SIE ← 0 (disable interrupts)                     │
│  7. MODE ← 1 (switch to supervisor)                          │
│  8. PC ← STVEC (jump to handler)                             │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                   Trap Handler (OS)                          │
│              Handle exception, then SRET                     │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                      trap_ret() / SRET                       │
│  1. PC ← SEPC (restore return address)                       │
│  2. MODE ← SSTATUS.SPP (restore privilege)                   │
│  3. SSTATUS.SIE ← SSTATUS.SPIE (restore interrupts)          │
└─────────────────────────────────────────────────────────────┘
```
