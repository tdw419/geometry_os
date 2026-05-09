; DESCRIPTION: Draws a green rectangle at (89, 106) with width 23 and height 38.
; PLAN: r0=89(x), r1=106(y), r2=23(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 106
LDI r2, 23
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
