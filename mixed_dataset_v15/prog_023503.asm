; DESCRIPTION: Draws a green rectangle at (278, 155) with width 22 and height 88.
; PLAN: r0=278(x), r1=155(y), r2=22(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 155
LDI r2, 22
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
