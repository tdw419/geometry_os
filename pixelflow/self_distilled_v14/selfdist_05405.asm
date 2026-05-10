; DESCRIPTION: Draws a green rectangle at (306, 89) with width 46 and height 26.
; PLAN: r0=306(x), r1=89(y), r2=46(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 89
LDI r2, 46
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
