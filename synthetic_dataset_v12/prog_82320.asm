; DESCRIPTION: Draws a green rectangle at (188, 144) with width 85 and height 106.
; PLAN: r0=188(x), r1=144(y), r2=85(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 144
LDI r2, 85
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
