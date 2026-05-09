; DESCRIPTION: Draws a blue rectangle at (287, 35) with width 84 and height 45.
; PLAN: r0=287(x), r1=35(y), r2=84(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 35
LDI r2, 84
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
