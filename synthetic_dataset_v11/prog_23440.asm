; DESCRIPTION: Draws a orange rectangle at (77, 159) with width 87 and height 35.
; PLAN: r0=77(x), r1=159(y), r2=87(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 159
LDI r2, 87
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
