; DESCRIPTION: Draws a blue rectangle at (43, 125) with width 119 and height 115.
; PLAN: r0=43(x), r1=125(y), r2=119(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 125
LDI r2, 119
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
