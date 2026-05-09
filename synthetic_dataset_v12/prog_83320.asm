; DESCRIPTION: Draws a yellow rectangle at (155, 1) with width 34 and height 38.
; PLAN: r0=155(x), r1=1(y), r2=34(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 1
LDI r2, 34
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
