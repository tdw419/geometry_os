; DESCRIPTION: Draws a yellow rectangle at (266, 123) with width 95 and height 66.
; PLAN: r0=266(x), r1=123(y), r2=95(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 123
LDI r2, 95
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
