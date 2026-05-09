; DESCRIPTION: Draws a blue rectangle at (210, 163) with width 29 and height 84.
; PLAN: r0=210(x), r1=163(y), r2=29(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 163
LDI r2, 29
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
