; DESCRIPTION: Draws a orange rectangle at (266, 66) with width 99 and height 78.
; PLAN: r0=266(x), r1=66(y), r2=99(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 66
LDI r2, 99
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
