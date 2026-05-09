; DESCRIPTION: Places a red 36x107 rectangle at position (147, 107).
; PLAN: r0=147(x), r1=107(y), r2=36(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 107
LDI r2, 36
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
