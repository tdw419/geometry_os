; DESCRIPTION: Draws a orange rectangle at (302, 69) with width 110 and height 116.
; PLAN: r0=302(x), r1=69(y), r2=110(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 69
LDI r2, 110
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
