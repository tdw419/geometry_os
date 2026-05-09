; DESCRIPTION: Draws a purple rectangle at (147, 13) with width 81 and height 115.
; PLAN: r0=147(x), r1=13(y), r2=81(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 13
LDI r2, 81
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
