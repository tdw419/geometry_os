; DESCRIPTION: Draws a yellow rectangle at (13, 158) with width 13 and height 69.
; PLAN: r0=13(x), r1=158(y), r2=13(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 158
LDI r2, 13
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
