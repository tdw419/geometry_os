; DESCRIPTION: Draws a yellow rectangle at (88, 14) with width 108 and height 84.
; PLAN: r0=88(x), r1=14(y), r2=108(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 14
LDI r2, 108
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
