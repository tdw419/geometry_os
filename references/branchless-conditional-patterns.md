# Branchless Conditional Patterns (CMOV, CSEL)

## Opcodes

### CMOV rd, rs, cond_reg (0xE0)
- **Words:** 4 `[0xE0, rd, rs, cond_reg]`
- **Semantics:** If `regs[cond_reg] != 0`, copy `regs[rs]` into `regs[rd]`. Otherwise `rd` is unchanged.
- **Use case:** Conditional assignment without branching. Replaces `CMP + BLT + LDI + MOV + JMP` patterns.

### CSEL rd, rs1, rs2, cond_reg (0xEF)
- **Words:** 5 `[0xEF, rd, rs1, rs2, cond_reg]`
- **Semantics:** If `regs[cond_reg] != 0`, `rd = rs1`. Otherwise `rd = rs2`.
- **Use case:** Branchless multiplexing. The Swiss-army knife of conditional logic.

## Common Patterns

### Branchless Min
```asm
; r1 = min(r2, r3)
CMP r2, r3          ; r0 = -1 if r2 < r3, else 0 or 1
CMOV r1, r2, r0     ; if r2 < r3, r1 = r2
; But this only covers one case. Use CSEL instead:
; r1 = min(r2, r3):
CMP r2, r3
CSEL r1, r2, r3, r0 ; if r2 < r3 (r0 = -1 != 0), r1 = r2, else r1 = r3
```

**Note:** CMP sets r0 to 0xFFFFFFFF (-1) for less-than, which is non-zero, so the condition is true.

### Branchless Max
```asm
; r1 = max(r2, r3)
CMP r3, r2          ; reverse comparison
CSEL r1, r2, r3, r0 ; if r3 < r2 (r0 != 0), r1 = r2 (bigger), else r1 = r3
```

### Branchless Abs
```asm
; r1 = abs(r2)
LDI r1, 0
SUB r1, r2          ; r1 = -r2
LDI r3, 31
SAR r2, r3          ; sign bit of r2: 0xFFFFFFFF if negative, 0 if positive
CSEL r1, r2, r1, r2 ; if r2 was positive (sign=0), r1 = r2; else r1 = -r2
```

**Wait — this uses r2 as both the value and the condition.** After `SUB r1, r2`, r2 is unchanged. `SAR r2, 31` overwrites r2 with the sign bit. Then `CSEL r1, r2, r1, r2` reads cond_reg=r2 (the sign). If sign=0 (was positive), r1=r2 (but r2 is now 0!). Bug. Correct pattern:

```asm
; r1 = abs(r2) -- correct version
PUSH r31
MOV r1, r2          ; save original
LDI r3, 31
SAR r3, r2          ; r3 = sign bit of r2 (0 or 0xFFFFFFFF)
JZ r3, abs_done     ; if positive, r1 already has the value
NEG r1              ; negate for negative case
abs_done:
POP r31
```

Or use a temp:
```asm
; r1 = abs(r2) -- branchless with temp
MOV r3, r2          ; r3 = original value
LDI r4, 31
SAR r4, r2          ; r4 = sign bit
XOR r3, r4          ; if negative: r3 = ~r2; if positive: r3 = r2
SUB r3, r4          ; if negative: ~r2 - (-1) = -r2; if positive: r2 - 0 = r2
MOV r1, r3          ; r1 = abs(r2)
```

### Branchless Clamp
```asm
; r1 = clamp(r2, lo, hi)  -- lo in r3, hi in r4
; Step 1: max(val, lo)
CMP r2, r3
CSEL r1, r2, r3, r0 ; r1 = max(r2, r3)
; Step 2: min(r1, hi)
CMP r1, r4
CSEL r1, r1, r4, r0 ; r1 = min(r1, r4)
```

### Conditional Pixel Color (graphics hot loops)
```asm
; Set color to red if entity is enemy, blue otherwise
; entity_type in r5
LDI r6, 1           ; enemy type
CMP r5, r6
CSEL r7, r_red, r_blue, r0  ; branchless color select
PSET r_x, r_y, r7
```

### Collision Response Without Branching
```asm
; If dist < threshold, set colliding flag
LDI r5, 16          ; threshold
CMP r_dist, r5      ; r0 = -1 if dist < threshold
CMOV r_flag, r_one, r0  ; set flag if colliding
```

## Performance Notes

CMOV and CSEL eliminate branch misprediction penalties in tight loops. On the Geometry OS VM (interpreted), the benefit is mainly in **code size reduction** and **predictable execution time** — every iteration takes the same number of instructions regardless of the condition. This matters for:

1. **Pixel rendering loops** — where branch misprediction would stall the FRAME tick
2. **Collision detection** — where different entities may or may not collide each frame
3. **Color selection** — where the same loop body handles multiple entity types

## Tests (13 total)

- `test_cmov_moves_when_condition_nonzero` — CMOV copies when cond != 0
- `test_cmov_no_move_when_condition_zero` — CMOV leaves rd unchanged when cond = 0
- `test_csel_selects_rs1_when_condition_nonzero` — CSEL picks rs1 when cond != 0
- `test_csel_selects_rs2_when_condition_zero` — CSEL picks rs2 when cond = 0
- `test_cmov_assemble` — assembler produces correct opcode 0xE0
- `test_csel_assemble` — assembler produces correct opcode 0xEF
- `test_cmov_branchless_min` — min(r2, r3) using CMP+CSEL
- `test_csel_branchless_max` — max(r2, r3) using CMP+CSEL
- `test_cmov_disasm` — disassembler round-trips CMOV
- `test_csel_disasm` — disassembler round-trips CSEL
- `test_cmov_bench_clamp_overflow` — clamping with overflow handling
- `test_csel_branchless_abs` — absolute value via XOR+SAR+CSEL pattern
- `test_cmov_branchless_clamp_multi` — multi-value clamping loop
