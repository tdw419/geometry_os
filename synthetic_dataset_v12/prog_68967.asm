; DESCRIPTION: Draws a orange rectangle at (166, 88) with width 31 and height 98.
; PLAN: r0=166(x), r1=88(y), r2=31(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 88
LDI r2, 31
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
