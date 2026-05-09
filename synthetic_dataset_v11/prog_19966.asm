; DESCRIPTION: Renders a white box of size 96x118 starting at (147, 39).
; PLAN: r0=147(x), r1=39(y), r2=96(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 39
LDI r2, 96
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
