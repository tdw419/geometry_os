; DESCRIPTION: Places a white 17x118 box at position (178, 2).
; PLAN: r0=178(x), r1=2(y), r2=17(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 2
LDI r2, 17
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
