; DESCRIPTION: Draws a orange rectangle at (97, 26) with width 88 and height 90.
; PLAN: r0=97(x), r1=26(y), r2=88(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 26
LDI r2, 88
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
