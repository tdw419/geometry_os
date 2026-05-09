; DESCRIPTION: Draws a orange rectangle at (79, 123) with width 30 and height 97.
; PLAN: r0=79(x), r1=123(y), r2=30(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 123
LDI r2, 30
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
