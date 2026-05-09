; DESCRIPTION: Draws a green rectangle at (40, 106) with width 100 and height 44.
; PLAN: r0=40(x), r1=106(y), r2=100(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 106
LDI r2, 100
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
