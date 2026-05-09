; DESCRIPTION: Draws a yellow rectangle at (78, 8) with width 106 and height 88.
; PLAN: r0=78(x), r1=8(y), r2=106(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 8
LDI r2, 106
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
