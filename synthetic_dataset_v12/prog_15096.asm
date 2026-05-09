; DESCRIPTION: Draws a orange rectangle at (100, 145) with width 22 and height 78.
; PLAN: r0=100(x), r1=145(y), r2=22(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 145
LDI r2, 22
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
