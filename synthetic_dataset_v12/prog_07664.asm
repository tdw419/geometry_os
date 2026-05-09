; DESCRIPTION: Draws a blue rectangle at (451, 68) with width 15 and height 35.
; PLAN: r0=451(x), r1=68(y), r2=15(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 68
LDI r2, 15
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
