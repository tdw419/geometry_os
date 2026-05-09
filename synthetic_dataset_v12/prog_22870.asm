; DESCRIPTION: Draws a purple rectangle at (226, 89) with width 13 and height 74.
; PLAN: r0=226(x), r1=89(y), r2=13(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 89
LDI r2, 13
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
