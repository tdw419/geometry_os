; DESCRIPTION: Draws a yellow rectangle at (110, 69) with width 62 and height 108.
; PLAN: r0=110(x), r1=69(y), r2=62(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 69
LDI r2, 62
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
