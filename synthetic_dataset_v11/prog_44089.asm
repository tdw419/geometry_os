; DESCRIPTION: Draws a green rectangle at (106, 89) with width 65 and height 19.
; PLAN: r0=106(x), r1=89(y), r2=65(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 89
LDI r2, 65
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
