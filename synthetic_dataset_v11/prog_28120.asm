; DESCRIPTION: Draws a purple rectangle at (15, 40) with width 99 and height 54.
; PLAN: r0=15(x), r1=40(y), r2=99(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 40
LDI r2, 99
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
