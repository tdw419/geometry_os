; DESCRIPTION: Draws a green rectangle at (129, 91) with width 51 and height 26.
; PLAN: r0=129(x), r1=91(y), r2=51(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 91
LDI r2, 51
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
