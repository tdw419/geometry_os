; DESCRIPTION: Draws a orange rectangle at (125, 170) with width 71 and height 77.
; PLAN: r0=125(x), r1=170(y), r2=71(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 170
LDI r2, 71
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
