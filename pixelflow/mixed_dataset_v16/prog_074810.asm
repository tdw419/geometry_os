; DESCRIPTION: Draws a orange rectangle at (212, 118) with width 107 and height 63.
; PLAN: r0=212(x), r1=118(y), r2=107(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 118
LDI r2, 107
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
