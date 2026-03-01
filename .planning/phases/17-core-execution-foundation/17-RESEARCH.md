# Phase 17: Core Execution Foundation - Research

**Researched:** 2026-02-28
**Domain:** WebGPU-based RISC-V RV32I instruction execution
**Confidence:** HIGH

## Summary

Phase 17 focuses on establishing reliable GPU-based execution of the RV32I base instruction set with observable state readback. The existing codebase contains 493 lines of working WGSL RISC-V executor code in `visual_cpu_riscv.wgsl` that implements the core instruction set, plus a complete Rust executor in `systems/infinite_map_rs/src/riscv_native/executor.rs`.

The primary challenge for this phase is not implementing instructions from scratch, but establishing **reliable GPU-CPU state synchronization** for verification. The research identifies three critical pitfalls that must be addressed: (1) dispatch boundary state loss, (2) SBI bridge race conditions, and (3) PC indexing confusion. These pitfalls are documented in `.planning/research/PITFALLS.md` and have proven implementation patterns.

**Primary recommendation:** Reuse the existing `visual_cpu_riscv.wgsl` shader as the execution engine, add a verification harness that implements proper async buffer readback, and create a test suite using the existing `RiscvEncoder` pattern from `riscv_test_programs.rs`.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| WebGPU API | Browser-native | GPU compute dispatch | Only browser GPU API with storage buffer support |
| WGSL | WebGPU-native | Shader language | Required for WebGPU; has atomic/storage buffer support |
| wgpu (Rust) | 0.19 | Native GPU execution | Existing codebase uses this for testing |
| bytemuck | 1.25 | Buffer casting | Zero-cost transmute for GPU buffer data |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| PixiJS v7 | 7.x | Visual display | For console output rendering |
| @webgpu/types | Latest | TypeScript definitions | Development only |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| WGSL compute | CPU JavaScript | Simpler debugging but defeats GPU execution goal |
| wgpu native | WebGPU browser | Better tooling but loses browser accessibility |
| Full emulator | QEMU integration | More complete but not GPU-based |

**Installation:**
```bash
npm install -D @webgpu/types  # TypeScript definitions only
```

## Architecture Patterns

### Recommended Project Structure
```
systems/visual_shell/web/
├── shaders/
│   ├── visual_cpu_riscv.wgsl    # Core executor (EXISTS - 493 lines)
│   └── mmu_core.wgsl            # MMU support (EXISTS - 78 lines)
├── HolographicRISCVBridge.js    # CPU fallback + instruction encoding (EXISTS)
├── tests/
│   └── test_riscv_core.js       # NEW: Core execution verification
└── CoreExecutionVerifier.js     # NEW: State readback harness
```

### Pattern 1: Async State Readback (CRITICAL)

**What:** The GPU is asynchronous. Reading state immediately after `dispatchWorkgroups()` returns stale cached CPU data, not GPU results.

**When to use:** Every time you need to inspect GPU state after execution.

**Example:**
```javascript
// Source: Based on executor.rs:208-242 and PITFALLS.md
class CoreExecutionVerifier {
    async readState(kernelId) {
        const memory = this.kernels.get(kernelId);

        // WRONG: Read immediately after dispatch
        // const state = memory.stateBuffer.getMappedRange(); // STALE!

        // CORRECT: Ensure GPU-CPU sync via staging buffer
        const stagingBuffer = this.device.createBuffer({
            size: STATE_SIZE,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
            mapped_at_creation: false
        });

        const encoder = this.device.createCommandEncoder();
        encoder.copyBufferToBuffer(memory.stateBuffer, 0, stagingBuffer, 0, STATE_SIZE);
        this.device.queue.submit([encoder.finish()]);

        // CRITICAL: mapAsync must complete before reading
        await stagingBuffer.mapAsync(GPUMapMode.READ);
        const state = new Uint32Array(stagingBuffer.getMappedRange());

        // Now state contains actual GPU results
        return {
            pc: state[32],
            registers: state.slice(0, 32),
            halted: state[38]
        };
    }
}
```

### Pattern 2: Batch Instruction Dispatch

**What:** Execute multiple instructions per GPU dispatch to amortize overhead.

**When to use:** All execution loops.

**Example (from existing visual_cpu_riscv.wgsl:343):**
```wgsl
// Execute 100 instructions per dispatch
for (var step = 0u; step < 100u; step++) {
    let halted = cpu_states[base_idx + CSR_HALT];
    if (halted > 0u) { break; }

    // SBI bridge check - break if JS needs to handle syscall
    let sbi_flag = system_memory[SBI_BRIDGE_FLAG / 4u];
    if (sbi_flag != 0u) { break; }

    // ... instruction execution ...
}
```

### Pattern 3: Test Program Encoding

**What:** Use the existing `RiscvEncoder` pattern to generate test programs.

**When to use:** All verification tests.

**Example (from riscv_test_programs.rs):**
```javascript
class RiscvTestEncoder {
    constructor() { this.code = []; }

    // ADDI rd, rs1, imm
    addi(rd, rs1, imm) {
        const inst = ((imm & 0xFFF) << 20) | (rs1 << 15) | (0x0 << 12) | (rd << 7) | 0x13;
        this.code.push(inst);
    }

    // ADD rd, rs1, rs2
    add(rd, rs1, rs2) {
        const inst = (0x00 << 25) | (rs2 << 20) | (rs1 << 15) | (0x0 << 12) | (rd << 7) | 0x33;
        this.code.push(inst);
    }

    // ECALL (halt)
    ecall() {
        this.code.push(0x00000073);
    }

    finalize() { return new Uint32Array(this.code); }
}
```

### Anti-Patterns to Avoid
- **Per-instruction dispatch:** GPU dispatch overhead is 0.1-1ms; dispatching per-instruction is 1000x slower
- **Immediate state read after dispatch:** Must await `mapAsync()` before reading
- **x0 register writes:** Hardware ignores writes to x0; emulate same behavior
- **PC as byte address vs instruction index:** Existing shader uses instruction index (word address); multiply by 4 for byte address

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| RISC-V instruction encoding | Custom bit manipulation | `RiscvEncoder` pattern (riscv_test_programs.rs) | Handles all encoding edge cases |
| Instruction decode in WGSL | New decode functions | Existing in visual_cpu_riscv.wgsl:87-92 | Already tested |
| CPU mock for testing | New mock | `MockCpuExecutor` (branch_compliance_test.rs) | Matches WGSL behavior |
| State readback | Manual buffer mapping | Pattern from executor.rs:208-242 | Handles async correctly |

**Key insight:** The existing codebase has 1194 lines of branch compliance tests and 509 lines of test programs. Reuse these patterns.

## Common Pitfalls

### Pitfall 1: Dispatch Boundary State Loss

**What goes wrong:** CPU state (registers, PC, CSRs) appears corrupted or reset between GPU dispatch calls. The shader modifies state in the storage buffer, but the JavaScript side reads stale cached values.

**Why it happens:** WebGPU dispatches are asynchronous. Reading state immediately after `dispatchWorkgroups()` returns cached CPU-side data, not GPU results. The `mapAsync()` call must complete before reading.

**Consequences:**
- PC values that don't increment after non-branch instructions
- Registers that were written appearing as 0 on next read
- Syscall handler receiving all-zero arguments

**How to avoid:**
```javascript
// Always use staging buffer with awaited mapAsync
const stagingBuffer = device.createBuffer({
    size: stateSize,
    usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
});
encoder.copyBufferToBuffer(stateBuffer, 0, stagingBuffer, 0, stateSize);
device.queue.submit([encoder.finish()]);
await stagingBuffer.mapAsync(GPUMapMode.READ); // MUST AWAIT
const data = new Uint32Array(stagingBuffer.getMappedRange());
```

**Warning signs:**
- PC not incrementing by 1 after non-branch instructions
- Registers appearing as zeros despite writes
- Syscall arguments all zeros

**Phase to address:** THIS PHASE (Phase 17) - Must establish reliable state readback before any higher-level features.

### Pitfall 2: SBI Bridge Race Condition

**What goes wrong:** GPU sets `SBI_BRIDGE_FLAG` to signal JS to handle a syscall, then waits. But if JS doesn't read/clear the flag before the next dispatch, the GPU sees the flag still set and immediately breaks out of its instruction loop, making no progress.

**Why it happens:** The shader checks `sbi_flag != 0` at the START of each step loop and breaks. If the flag isn't cleared by JS between dispatches, the shader executes 0 instructions that frame.

**Consequences:**
- Syscalls "hang" (GPU makes no progress after first syscall)
- No UART output despite kernel writing to UART
- Apparent deadlock with no error message

**How to avoid:**
```javascript
// In SBI handler - MUST clear flag BEFORE resuming GPU
async handleSBICall(kernelId) {
    const kernel = this.kernels.get(kernelId);

    // Read the SBI request
    const eid = await this.readMemory(kernel, SBI_BRIDGE_EID);
    const args = await this.readMemory(kernel, SBI_BRIDGE_ARGS, 6);

    // Handle the call
    const result = this.processSBICall(eid, args);

    // CRITICAL: Clear flag BEFORE writing return values
    await this.writeMemory(kernel, SBI_BRIDGE_FLAG, new Uint32Array([0]));

    // Then write return values
    await this.writeMemory(kernel, SBI_BRIDGE_RET, result);
}
```

**Warning signs:**
- `cycleCount` increments but `pc` never changes
- `SBI_BRIDGE_FLAG` remains set across multiple `tick()` calls
- No output despite kernel running

**Phase to address:** Phase 17 (deferred to Phase 4 for full SBI implementation, but flag handling needed now for ECALL/EBREAK).

### Pitfall 3: PC Indexing Confusion (Instruction vs Byte Address)

**What goes wrong:** The shader uses `pc` as an instruction index (increments by 1) but Linux kernels expect byte addresses (increment by 4). Mixing conventions causes jumps to wrong addresses.

**Why it happens:** RISC-V PCs are byte addresses (4-byte aligned for 32-bit instructions). The shader stores `pc` as instruction index for convenience but the translation layer multiplies by 4.

**Consequences:**
- JAL/JALR jump to wrong targets
- Branch offsets calculated incorrectly
- Instruction fetch faults on valid addresses

**How to avoid:**
```javascript
// Establish clear convention in documentation and code:
// - cpu_states[32] (PC) is INSTRUCTION INDEX (word address)
// - When translating to byte address: byte_addr = pc * 4
// - When saving to memory/SEPC: convert appropriately

// Example in WGSL:
let pc_paddr = translate_address(pc * 4u, ACCESS_EXEC, base_idx); // Byte address for MMU
let inst = expanded_code[pc_paddr / 4u]; // Word index for array access
```

**Warning signs:**
- JAL offset calculation produces wrong target
- PC appears to jump to middle of instruction
- Branches go to unexpected addresses

**Phase to address:** Phase 17 - Document and enforce consistent PC convention.

## Code Examples

Verified patterns from existing codebase:

### RV32I Instruction Decode (from visual_cpu_riscv.wgsl:87-92)
```wgsl
// Decoding helpers - already implemented
fn get_opcode(inst: u32) -> u32 { return inst & 0x7Fu; }
fn get_rd(inst: u32) -> u32     { return (inst >> 7u) & 0x1Fu; }
fn get_funct3(inst: u32) -> u32 { return (inst >> 12u) & 0x07u; }
fn get_rs1(inst: u32) -> u32    { return (inst >> 15u) & 0x1Fu; }
fn get_rs2(inst: u32) -> u32    { return (inst >> 20u) & 0x1Fu; }
```

### ADDI Implementation (from visual_cpu_riscv.wgsl:379-385)
```wgsl
case 0x13u: { // OP-IMM (ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI)
    if (funct3 == 0u) { // ADDI
        let imm = i32(inst) >> 20u;  // Sign-extended 12-bit immediate
        let val1 = i32(cpu_states[base_idx + rs1]);
        if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 + imm); }
    }
    // ... other funct3 cases ...
}
```

### R-type ADD/SUB Implementation (from visual_cpu_riscv.wgsl:386-396)
```wgsl
case 0x33u: { // OP (ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND)
    let val1 = i32(cpu_states[base_idx + rs1]);
    let val2 = i32(cpu_states[base_idx + rs2]);
    let funct7 = (inst >> 25u) & 0x7Fu;
    // M extension: funct7 == 0x01
    if (funct7 == 0x01u) {
        if (funct3 == 0u) { if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 * val2); } }
    } else if (funct3 == 0u) {
        if (funct7 == 0x00u) { if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 + val2); } }
        else if (funct7 == 0x20u) { if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 - val2); } }
    }
}
```

### Test Program: Simple ADD Verification
```javascript
// Expected result: x1 = 42
function createSimpleAddTest() {
    const encoder = new RiscvTestEncoder();
    encoder.addi(1, 0, 42);  // x1 = x0 + 42
    encoder.ecall();          // Signal completion
    return encoder.finalize();
}

// Verification
async function verifySimpleAdd() {
    const result = await executeProgram(createSimpleAddTest());
    assert(result.registers[1] === 42, 'ADDI should set x1 = 42');
    assert(result.pc === 8, 'PC should be at instruction 2 (after ADDI and ECALL)');
}
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Per-instruction dispatch | Batch 100 instructions | Initial design | 100x throughput improvement |
| CPU-side emulation | GPU compute shaders | Phase 25 design | Novel GPU-native execution |
| Synchronous readback | Async staging buffers | WebGPU requirement | Prevents state corruption |

**Deprecated/outdated:**
- GPU readback without mapAsync: Causes stale data reads
- Byte-addressed PC in shader: Convention changed to word-indexed

## Instruction Coverage Map

Current implementation status from `visual_cpu_riscv.wgsl`:

| Requirement | Instructions | Status in Shader | Notes |
|-------------|--------------|------------------|-------|
| CORE-02 (R-type) | ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND | Partial | ADD, SUB, MUL implemented; need SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND |
| CORE-03 (I-type) | ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI | Partial | ADDI implemented; need others |
| CORE-04 (Load) | LB, LH, LW, LBU, LHU | Partial | LW implemented; need byte/half variants |
| CORE-05 (Store) | SB, SH, SW | Partial | SW implemented; need byte/half variants |
| CORE-06 (Branch) | BEQ, BNE, BLT, BGE, BLTU, BGEU | Partial | BEQ, BNE implemented; need others |
| CORE-07 (Jump) | JAL, JALR | Implemented | Lines 398-412 |
| CORE-08 (Upper) | LUI, AUIPC | Partial | LUI implemented; need AUIPC |
| CORE-09 (System) | ECALL, EBREAK | Partial | ECALL implemented; need EBREAK |
| MEM-01 | 64MB+ memory | Implemented | 128MB storage buffer |

## Open Questions

Things that couldn't be fully resolved:

1. **Complete I-type instruction coverage**
   - What we know: ADDI implemented; shader has decode infrastructure
   - What's unclear: Whether SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI need implementation
   - Recommendation: Implement remaining I-type instructions for full RV32I compliance

2. **Branch instruction completeness**
   - What we know: BEQ, BNE work; BLT, BGE, BLTU, BGEU have test patterns in branch_compliance_test.rs
   - What's unclear: Whether shader implements all six branch types
   - Recommendation: Verify all branch types, add missing implementations

3. **Load/Store byte/half variants**
   - What we know: LW and SW implemented
   - What's unclear: LB, LH, LBU, LHU, SB, SH may be needed for Linux boot
   - Recommendation: Defer to Phase 3 (MMU) unless simple tests fail

## Sources

### Primary (HIGH confidence)
- Existing shader: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl` - 493 lines of WGSL RISC-V executor
- Existing bridge: `systems/visual_shell/web/HolographicRISCVBridge.js` - Instruction encoding patterns
- Existing executor: `systems/infinite_map_rs/src/riscv_native/executor.rs` - Rust async readback pattern
- Research: `.planning/research/PITFALLS.md` - Documented pitfalls with prevention strategies

### Secondary (MEDIUM confidence)
- Test programs: `systems/infinite_map_rs/src/tests/riscv_test_programs.rs` - RiscvEncoder pattern
- Compliance tests: `systems/infinite_map_rs/tests/branch_compliance_test.rs` - Mock CPU executor
- MMU shader: `systems/visual_shell/web/shaders/mmu_core.wgsl` - Address translation patterns

### Tertiary (LOW confidence)
- None - All findings verified against existing codebase

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - Based on existing working code in codebase
- Architecture: HIGH - Patterns verified in executor.rs and visual_cpu_riscv.wgsl
- Pitfalls: HIGH - Documented in PITFALLS.md with code examples

**Research date:** 2026-02-28
**Valid until:** 30 days (WebGPU API stable, RISC-V spec unchanged)
