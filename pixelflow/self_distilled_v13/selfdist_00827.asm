; DESCRIPTION: Draws a orange rectangle at (70, 123) with width 38 and height 69.
; PLAN: r0=70(x), r1=123(y), r2=38(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 123
LDI r2, 38
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
