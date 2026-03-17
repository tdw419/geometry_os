# Plan: Self-Hosting Quine Fix

## Objective
Fix the self-hosting assembler (`self_hosting_assembler.glyph`) to produce bit-identical output when compiling itself, achieving true sovereignty.

## Status: IN PROGRESS

### Completed
- [x] LDI forward reference support in Rust assembler
- [x] Label table mechanism tested
- [x] Assembler output encoding tested

### Current Blocker
- [ ] `test_self_hosting_quine` fails - output is ASCII/source instead of assembled binary

## Problem Analysis

### Test Failure Evidence
```
Offset 0: Expected 00000001 (LDI r0 instruction), Got 00000800 (init_mnem_table address)
```

The self-hosting assembler is outputting:
1. Address values (0x800) instead of instruction encodings
2. ASCII characters ('R', 'E', ' ') instead of assembled code

### Root Cause Hypothesis
Pass 2 emit logic has bugs:
1. `p2_emit_ldi` may be writing wrong data format
2. Label resolution may be emitting addresses instead of values
3. Instruction encoding may be incorrect

## Memory Layout
```
0x0000-0x0FFF: Assembler Binary (executing)
0x1000-0x1FFF: Source Table (ASCII of assembler)
0x2000-0x2FFF: Output Binary (compiled version)
0x3000-0x3FFF: Label Table (labels found in Pass 1)
0x4004:         PASS_COUNTER (0=Pass1, 1=Pass2)
```

## Implementation Tasks

### Task 1: Diagnose Quine Failure
**Goal**: Understand exactly what Pass 2 is outputting

**Files**:
- `systems/glyph_stratum/programs/self_hosting_assembler.glyph`
- `systems/infinite_map_rs/src/synthetic_vram.rs` (test)

**Steps**:
1. Add detailed trace output to synthetic_vram test
2. Run test and capture first 100 words of output
3. Compare expected vs actual at each offset
4. Identify the first divergence point

**Verification**:
```bash
cargo test --lib test_self_hosting_quine -- --nocapture 2>&1 | head -100
```

**Commit**: `debug(glyph): trace self-hosting quine failure points`

---

### Task 2: Fix LDI Emit Logic
**Goal**: Ensure `p2_emit_ldi` produces correct instruction encoding

**Current Code (lines 90-94)**:
```glyph
:p2_emit_ldi
    LDI r14, :skip_ws; CALL r14; LDI r14, :parse_operand; CALL r14; MOV r10, r7
    LDI r14, :skip_ws; CALL r14; LDI r14, :parse_operand; CALL r14; MOV r11, r7
    LDI r14, 16; SLL r15, r10, r14; LDI r3, 1; OR r3, r3, r15
    STORE r1, r3; ADD r1, r1, r13; STORE r1, r11; ADD r1, r1, r13; JMP :p2_skip_line
```

**Issue**: Encoding format may be wrong. Expected:
- Word 1: `opcode | (stratum << 8) | (rd << 16) | (0 << 24)` = `1 | 0 | (rd<<16) | 0`
- Word 2: immediate value

**Fix Steps**:
1. Verify `r10` contains register number (0-127)
2. Verify `r11` contains immediate value
3. Check encoding: `r3 = 1 | (r10 << 16)` should produce `0x00rr0001`
4. Add debug output to see actual r3 and r11 values

**Verification**:
```bash
cargo test --lib test_self_hosting_quine -- --nocapture
# Should see 00000001 at offset 0, not 00000800
```

**Commit**: `fix(glyph): correct LDI emit encoding in self-hosting assembler`

---

### Task 3: Verify Instruction Encoding
**Goal**: Ensure all instruction types encode correctly

**Instructions to Verify**:
| Instruction | Expected Encoding | Format |
|-------------|------------------|--------|
| LDI rd, imm | `01 \| (rd<<16)` | 2 words |
| ADD rd, rs1, rs2 | `05 \| (rs1<<16) \| (rd<<24)` | 1 word |
| HALT | `0D` | 1 word |
| RET | `0C` | 1 word |

**Steps**:
1. Create isolated test for each instruction type
2. Run through synthetic VRAM
3. Compare output encoding

**Verification**:
```bash
cargo test --lib test_self_hosting_quine -- --nocapture
# All instruction encodings match
```

**Commit**: `test(glyph): verify all instruction encodings`

---

### Task 4: Fix Pass 2 Dispatch Logic
**Goal**: Ensure correct instruction routing in Pass 2

**Current Dispatch (lines 76-79)**:
```glyph
LDI r14, 0xFF; BEQ r4, r14, :p2_skip_line
LDI r14, 13; BEQ r4, r14, :p2_emit_halt
LDI r14, 12; BEQ r4, r14, :p2_emit_ret
LDI r14, 1;  BEQ r4, r14, :p2_emit_ldi
```

**Potential Issues**:
1. `r4` may not contain correct opcode from `match_mnemonic`
2. Fall-through to wrong emit path
3. Missing opcode handlers

**Steps**:
1. Trace `match_mnemonic` return values
2. Verify opcode numbers match table
3. Add missing opcode handlers (ADD=5, SUB=6, etc.)

**Verification**:
```bash
cargo test --lib test_self_hosting_quine -- --nocapture
# Correct dispatch to emit functions
```

**Commit**: `fix(glyph): correct Pass 2 dispatch routing`

---

### Task 5: Achieve Bit-Identical Output
**Goal**: Self-hosting assembler produces exact copy of itself

**Steps**:
1. Run all previous fixes
2. Verify first 200 words match
3. Verify full binary matches
4. Celebrate sovereignty

**Verification**:
```bash
cargo test --lib test_self_hosting_quine -- --nocapture
# Output: "✓ Output binary is bit-identical to executing binary."
# Output: "✓ SOVEREIGNTY COMPLETE."
```

**Commit**: `feat(glyph): self-hosting quine achieves bit-identical output`

---

## Success Criteria
- [ ] `test_self_hosting_quine` passes
- [ ] Output at 0x2000 matches binary at 0x0000
- [ ] First 200 words are bit-identical
- [ ] Full binary is bit-identical

## Testing Strategy
1. **Unit Tests**: Existing assembler tests (6 passing)
2. **Integration**: Synthetic VRAM quine test
3. **Verification**: Bit-by-bit comparison

## Rollback Plan
If fixes break existing tests:
```bash
git revert HEAD  # Revert last commit
git checkout 85ac12b9 -- systems/glyph_stratum/programs/self_hosting_assembler.glyph  # Restore known-good
```

## Notes
- The Rust assembler fix for LDI forward references is complete
- The bug is in the Glyph assembly code, not the substrate
- Work in small increments, test after each change
