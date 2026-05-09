; DESCRIPTION: Draws a blue rectangle at (336, 134) with width 23 and height 84.
; PLAN: r0=336(x), r1=134(y), r2=23(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 134
LDI r2, 23
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
