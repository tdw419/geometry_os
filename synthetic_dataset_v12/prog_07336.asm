; DESCRIPTION: Draws a orange rectangle at (306, 63) with width 107 and height 115.
; PLAN: r0=306(x), r1=63(y), r2=107(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 63
LDI r2, 107
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
