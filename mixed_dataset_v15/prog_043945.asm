; DESCRIPTION: Draws a orange rectangle at (93, 0) with width 97 and height 77.
; PLAN: r0=93(x), r1=0(y), r2=97(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 0
LDI r2, 97
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
