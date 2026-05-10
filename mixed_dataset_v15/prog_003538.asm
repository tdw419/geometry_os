; DESCRIPTION: Draws a purple rectangle at (99, 183) with width 22 and height 40.
; PLAN: r0=99(x), r1=183(y), r2=22(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 183
LDI r2, 22
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
