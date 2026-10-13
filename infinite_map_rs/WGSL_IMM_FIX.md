# WGSL Immediate Extraction Bug Fix

## Problem Identified

The WGSL RISC-V emulator has missing bit field masks when extracting immediate values from instructions. This causes garbage upper bits to propagate, corrupting the immediate values.

## Root Cause

The `sign_ext12()` function does NOT mask to 12 bits first:

```wgsl
// WRONG - extracts 20 bits, not 12!
let imm_i = sign_ext12(instr >> 20u);
```

The sign_ext12 function:
```wgsl
fn sign_ext12(x: u32) -> i32 {
    if ((x & 0x800u) != 0u) {
        return i32(x | 0xFFFFF000u);
    }
    return i32(x);
}
```

When you pass `instr >> 20u` without masking, you get 12 bits of immediate PLUS 8 bits of garbage from the upper part of the instruction word.

## Fix Pattern

For all 12-bit immediate extractions (I-type, S-type):

```wgsl
// CORRECT - mask to exact field width BEFORE sign extension
let imm_u = (instr >> 20u) & 0xFFFu;
let imm = sign_ext12(imm_u);
```

## Affected Instructions

1. **OP_OP_IMM (ADDI, XORI, ORI, ANDI, SLLI, SRLI, SRAI)**
   - Line 518: `let imm = sign_ext12(instr >> 20u);`
   - Should be: `let imm = sign_ext12((instr >> 20u) & 0xFFFu);`

2. **OP_LOAD (LW, LB, LH, LBU, LHU)**
   - Line 465: `let imm_i = sign_ext12(instr >> 20u);`
   - Should be: `let imm_i = sign_ext12((instr >> 20u) & 0xFFFu);`

3. **OP_JALR**
   - Line 435: `let imm_i = sign_ext12(instr >> 20u);`
   - Should be: `let imm_i = sign_ext12((instr >> 20u) & 0xFFFu);`

4. **OP_STORE** - ALREADY CORRECT
   - Line 500: Uses proper masking: `((instr >> 7u) & 0x1Fu) | ((instr >> 25u) << 5u)`
   - No fix needed

## Test Program Affected

The test program uses:
- `li t0, 0x2024` → `addi t0, x0, 0x2024` (OP_OP_IMM)
- `li t1, 10` → `addi t1, x0, 10` (OP_OP_IMM)
- `li a7, 291` → `addi a7, x0, 291` (OP_OP_IMM)
- `sw zero, 0(t0)` (OP_STORE - works correctly)
- `lw t1, 0(t0)` (OP_LOAD)

All `li` pseudo-instructions compile to `addi rd, x0, imm`, which use the broken immediate extraction.

## Impact

This bug causes:
- Incorrect immediate values in ADDI/XORI/ORI/ANDI instructions
- Incorrect memory addresses in LW/LH/LB loads
- Incorrect jump targets in JALR
- VM appears to "not execute" because all instruction operands are corrupted

## Verification

After fixing, test that:
1. Simple ADDI works: `addi a0, x0, 10` → a0 = 10 (not 10 + garbage)
2. Load with immediate offset: `lw a0, 4(sp)` → loads from sp + 4 (correct)
3. Test program executes ECALL and halts properly

## Related

See gpu-riscv-emulator-debugging skill: "Immediate Sign-Extension Bug" section for detailed analysis and test patterns.