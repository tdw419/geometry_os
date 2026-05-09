; DESCRIPTION: Draws a blue rectangle at (338, 88) with width 106 and height 47.
; PLAN: r0=338(x), r1=88(y), r2=106(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 88
LDI r2, 106
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
