; DESCRIPTION: Draws a blue rectangle at (347, 113) with width 88 and height 98.
; PLAN: r0=347(x), r1=113(y), r2=88(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 113
LDI r2, 88
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
