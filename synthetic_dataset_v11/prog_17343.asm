; DESCRIPTION: Draws a orange rectangle at (80, 106) with width 15 and height 23.
; PLAN: r0=80(x), r1=106(y), r2=15(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 106
LDI r2, 15
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
