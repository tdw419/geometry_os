; DESCRIPTION: Draws a blue rectangle at (347, 76) with width 108 and height 10.
; PLAN: r0=347(x), r1=76(y), r2=108(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 76
LDI r2, 108
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
