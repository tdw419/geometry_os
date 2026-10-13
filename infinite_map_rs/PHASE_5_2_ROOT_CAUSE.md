# Phase 5.2 - ROOT CAUSE: Early Return After ECALL

## Status: ✅ FIXED (Second Bug)

### Root Cause Analysis

The test still failed after fixing the immediate extraction bug. Investigation revealed a SECOND critical bug:

**Line 569-571 in glyph_vm_riscv.wgsl:**

```wgsl
let result = do_ecall();
if (registers[1] != 0u) {
    return;  // <-- BUG: Exits function, skipping PC update!
}
registers[10] = result;
```

### Why This Breaks Everything

1. ECALL executes → `do_ecall()` sets `registers[1] = 1` (ready_flag)
2. Line 569 checks `if (registers[1] != 0)` → TRUE
3. `return` exits the function IMMEDIATELY
4. **Line 651 never executes**: `registers[0] = next_pc;`
5. PC stays at the ECALL instruction
6. Next frame: same ECALL executes again
7. **Infinite loop**: ECALL never completes

### Correct ECALL Semantics

ECALL should:
1. Trigger a syscall (via `do_ecall()`)
2. Store result in `a0` (register[10])
3. **Continue to next instruction** (PC += 4)

ECALL is NOT a halt - it's a trap/syscall that returns control after handling.

### The Fix

**Remove the early return:**

```wgsl
case OP_SYSTEM: {
    if (funct3 == 0u && (instr & 0xFFFFFFFFu) == 0x00000073u) {
        // ECALL
        write_rd = false;
        let result = do_ecall();
        registers[10] = result;  // Store result in a0
    } else if (funct3 == 1u) {
```

Now:
- ECALL executes → result stored in registers[10]
- Function continues to line 651
- PC updates to next instruction
- Normal execution resumes

### About registers[1] (ready_flag)

The `registers[1] = 1u` in `do_ecall()` signals to the **CPU-side orchestration** that a syscall is pending. It's used by `execute_compressed()` at line 389 to skip work when syscalls need processing:

```wgsl
if (global_id.x > 0u || registers[1] != 0u) {
    return;  // Skip execution, wait for CPU to handle syscall
}
```

But inside the main 32-bit decode path, after ECALL is handled, we should **not** check ready_flag again - we've already processed the syscall!

### Summary of Both Fixes

**Bug 1: Missing Immediate Masks**
- Fixed: `let imm = sign_ext12((instr >> 20u) & 0xFFFu);`
- Lines: 435, 465, 518

**Bug 2: Early Return After ECALL**
- Fixed: Removed `if (registers[1] != 0u) { return; }`
- Line: 569-571

Both bugs are now fixed. The VM should execute correctly.

---

**Timestamp**: 2025-01-XX
**Fixed By**: Systematic code inspection + manual analysis