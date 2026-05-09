; DESCRIPTION: Draws a orange rectangle at (75, 199) with width 112 and height 26.
; PLAN: r0=75(x), r1=199(y), r2=112(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 199
LDI r2, 112
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
