; DESCRIPTION: Draws a green rectangle at (55, 211) with width 25 and height 37.
; PLAN: r0=55(x), r1=211(y), r2=25(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 211
LDI r2, 25
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
