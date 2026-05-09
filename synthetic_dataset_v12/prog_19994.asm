; DESCRIPTION: Draws a green rectangle at (55, 144) with width 35 and height 23.
; PLAN: r0=55(x), r1=144(y), r2=35(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 144
LDI r2, 35
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
