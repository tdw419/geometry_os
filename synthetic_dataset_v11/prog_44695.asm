; DESCRIPTION: Draws a blue rectangle at (200, 55) with width 56 and height 62.
; PLAN: r0=200(x), r1=55(y), r2=56(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 55
LDI r2, 56
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
