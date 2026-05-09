; DESCRIPTION: Draws a black rectangle at (292, 49) with width 101 and height 88.
; PLAN: r0=292(x), r1=49(y), r2=101(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 49
LDI r2, 101
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
