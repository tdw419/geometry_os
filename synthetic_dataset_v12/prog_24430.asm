; DESCRIPTION: Draws a black rectangle at (88, 110) with width 30 and height 19.
; PLAN: r0=88(x), r1=110(y), r2=30(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 110
LDI r2, 30
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
