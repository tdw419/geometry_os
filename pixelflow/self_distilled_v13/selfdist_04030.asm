; DESCRIPTION: Draws a orange rectangle at (91, 192) with width 90 and height 26.
; PLAN: r0=91(x), r1=192(y), r2=90(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 192
LDI r2, 90
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
