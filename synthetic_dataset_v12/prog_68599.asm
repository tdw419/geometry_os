; DESCRIPTION: Places a red 15x40 rectangle at position (147, 183).
; PLAN: r0=147(x), r1=183(y), r2=15(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 183
LDI r2, 15
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
