; DESCRIPTION: Draws a orange rectangle at (125, 138) with width 78 and height 83.
; PLAN: r0=125(x), r1=138(y), r2=78(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 138
LDI r2, 78
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
