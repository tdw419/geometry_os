; DESCRIPTION: Draws a orange rectangle at (147, 125) with width 75 and height 26.
; PLAN: r0=147(x), r1=125(y), r2=75(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 125
LDI r2, 75
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
