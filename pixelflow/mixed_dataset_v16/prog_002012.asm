; DESCRIPTION: Draws a blue rectangle at (390, 101) with width 92 and height 88.
; PLAN: r0=390(x), r1=101(y), r2=92(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 101
LDI r2, 92
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
