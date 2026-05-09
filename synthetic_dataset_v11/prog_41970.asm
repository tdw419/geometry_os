; DESCRIPTION: Draws a orange rectangle at (33, 40) with width 18 and height 69.
; PLAN: r0=33(x), r1=40(y), r2=18(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 40
LDI r2, 18
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
