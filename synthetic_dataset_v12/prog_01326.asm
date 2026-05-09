; DESCRIPTION: Draws a purple rectangle at (97, 118) with width 40 and height 83.
; PLAN: r0=97(x), r1=118(y), r2=40(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 118
LDI r2, 40
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
