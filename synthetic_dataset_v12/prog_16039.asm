; DESCRIPTION: Draws a orange rectangle at (232, 71) with width 91 and height 107.
; PLAN: r0=232(x), r1=71(y), r2=91(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 71
LDI r2, 91
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
