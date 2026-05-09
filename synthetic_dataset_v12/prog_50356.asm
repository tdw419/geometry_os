; DESCRIPTION: Draws a orange rectangle at (35, 156) with width 53 and height 69.
; PLAN: r0=35(x), r1=156(y), r2=53(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 156
LDI r2, 53
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
