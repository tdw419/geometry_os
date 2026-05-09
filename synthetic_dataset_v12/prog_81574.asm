; DESCRIPTION: Draws a orange rectangle at (138, 122) with width 112 and height 78.
; PLAN: r0=138(x), r1=122(y), r2=112(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 122
LDI r2, 112
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
