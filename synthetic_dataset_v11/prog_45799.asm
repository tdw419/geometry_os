; DESCRIPTION: Draws a purple rectangle at (133, 28) with width 88 and height 15.
; PLAN: r0=133(x), r1=28(y), r2=88(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 28
LDI r2, 88
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
