; DESCRIPTION: Draws a green rectangle at (106, 188) with width 89 and height 12.
; PLAN: r0=106(x), r1=188(y), r2=89(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 188
LDI r2, 89
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
