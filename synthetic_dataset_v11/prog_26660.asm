; DESCRIPTION: Draws a blue rectangle at (84, 108) with width 111 and height 45.
; PLAN: r0=84(x), r1=108(y), r2=111(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 108
LDI r2, 111
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
