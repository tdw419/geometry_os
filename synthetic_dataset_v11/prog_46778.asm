; DESCRIPTION: Draws a purple rectangle at (36, 89) with width 115 and height 99.
; PLAN: r0=36(x), r1=89(y), r2=115(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 89
LDI r2, 115
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
