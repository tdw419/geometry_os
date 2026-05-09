; DESCRIPTION: Draws a purple rectangle at (98, 118) with width 40 and height 99.
; PLAN: r0=98(x), r1=118(y), r2=40(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 118
LDI r2, 40
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
