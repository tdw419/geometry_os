; DESCRIPTION: Draws a orange rectangle at (59, 85) with width 97 and height 106.
; PLAN: r0=59(x), r1=85(y), r2=97(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 85
LDI r2, 97
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
