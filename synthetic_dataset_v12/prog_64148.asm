; DESCRIPTION: Draws a orange rectangle at (63, 110) with width 50 and height 81.
; PLAN: r0=63(x), r1=110(y), r2=50(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 110
LDI r2, 50
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
