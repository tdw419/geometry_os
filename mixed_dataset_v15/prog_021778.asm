; DESCRIPTION: Places a red 32x58 box at position (268, 107).
; PLAN: r0=268(x), r1=107(y), r2=32(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 107
LDI r2, 32
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
