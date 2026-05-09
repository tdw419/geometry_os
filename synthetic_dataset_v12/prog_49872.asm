; DESCRIPTION: Draws a purple rectangle at (34, 88) with width 84 and height 21.
; PLAN: r0=34(x), r1=88(y), r2=84(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 88
LDI r2, 84
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
