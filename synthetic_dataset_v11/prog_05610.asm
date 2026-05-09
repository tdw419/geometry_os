; DESCRIPTION: Draws a purple rectangle at (81, 119) with width 44 and height 88.
; PLAN: r0=81(x), r1=119(y), r2=44(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 119
LDI r2, 44
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
