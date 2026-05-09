; DESCRIPTION: Draws a blue rectangle at (315, 17) with width 88 and height 110.
; PLAN: r0=315(x), r1=17(y), r2=88(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 17
LDI r2, 88
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
