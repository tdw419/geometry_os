; DESCRIPTION: Draws a black rectangle at (389, 15) with width 54 and height 88.
; PLAN: r0=389(x), r1=15(y), r2=54(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 15
LDI r2, 54
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
