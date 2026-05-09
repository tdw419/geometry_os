; DESCRIPTION: Draws a orange rectangle at (266, 69) with width 101 and height 71.
; PLAN: r0=266(x), r1=69(y), r2=101(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 69
LDI r2, 101
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
