; DESCRIPTION: Draws a black rectangle at (106, 170) with width 36 and height 75.
; PLAN: r0=106(x), r1=170(y), r2=36(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 170
LDI r2, 36
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
