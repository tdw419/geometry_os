; DESCRIPTION: Draws a green rectangle at (188, 110) with width 45 and height 63.
; PLAN: r0=188(x), r1=110(y), r2=45(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 110
LDI r2, 45
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
