; DESCRIPTION: Draws a orange rectangle at (81, 8) with width 97 and height 94.
; PLAN: r0=81(x), r1=8(y), r2=97(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 8
LDI r2, 97
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
