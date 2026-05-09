; DESCRIPTION: Draws a purple rectangle at (88, 81) with width 87 and height 80.
; PLAN: r0=88(x), r1=81(y), r2=87(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 81
LDI r2, 87
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
