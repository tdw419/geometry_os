; DESCRIPTION: Draws a orange rectangle at (390, 156) with width 118 and height 49.
; PLAN: r0=390(x), r1=156(y), r2=118(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 156
LDI r2, 118
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
