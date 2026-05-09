; DESCRIPTION: Draws a blue rectangle at (462, 43) with width 24 and height 115.
; PLAN: r0=462(x), r1=43(y), r2=24(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 43
LDI r2, 24
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
