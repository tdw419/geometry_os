; DESCRIPTION: Draws a purple rectangle at (226, 8) with width 119 and height 89.
; PLAN: r0=226(x), r1=8(y), r2=119(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 8
LDI r2, 119
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
