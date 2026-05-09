; DESCRIPTION: Draws a green rectangle at (132, 125) with width 62 and height 45.
; PLAN: r0=132(x), r1=125(y), r2=62(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 125
LDI r2, 62
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
