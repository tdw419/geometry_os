; DESCRIPTION: Draws a purple rectangle at (14, 53) with width 88 and height 52.
; PLAN: r0=14(x), r1=53(y), r2=88(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 53
LDI r2, 88
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
