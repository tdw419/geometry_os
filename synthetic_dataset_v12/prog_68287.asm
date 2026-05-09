; DESCRIPTION: Draws a purple rectangle at (35, 217) with width 22 and height 30.
; PLAN: r0=35(x), r1=217(y), r2=22(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 217
LDI r2, 22
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
