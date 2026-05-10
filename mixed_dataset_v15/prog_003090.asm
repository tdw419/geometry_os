; DESCRIPTION: Draws a blue rectangle at (363, 84) with width 111 and height 62.
; PLAN: r0=363(x), r1=84(y), r2=111(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 84
LDI r2, 111
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
