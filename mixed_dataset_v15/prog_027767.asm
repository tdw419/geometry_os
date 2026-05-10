; DESCRIPTION: Draws a orange rectangle at (31, 31) with width 69 and height 119.
; PLAN: r0=31(x), r1=31(y), r2=69(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 31
LDI r2, 69
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
