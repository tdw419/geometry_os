; DESCRIPTION: Draws a orange rectangle at (125, 170) with width 36 and height 65.
; PLAN: r0=125(x), r1=170(y), r2=36(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 170
LDI r2, 36
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
