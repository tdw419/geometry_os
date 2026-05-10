; DESCRIPTION: Draws a orange rectangle at (6, 188) with width 84 and height 75.
; PLAN: r0=6(x), r1=188(y), r2=84(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 188
LDI r2, 84
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
