; DESCRIPTION: Draws a yellow rectangle at (34, 38) with width 31 and height 88.
; PLAN: r0=34(x), r1=38(y), r2=31(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 38
LDI r2, 31
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
