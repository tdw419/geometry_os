; DESCRIPTION: Draws a green rectangle at (88, 17) with width 35 and height 70.
; PLAN: r0=88(x), r1=17(y), r2=35(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 17
LDI r2, 35
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
