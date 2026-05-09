; DESCRIPTION: Draws a yellow rectangle at (266, 30) with width 22 and height 118.
; PLAN: r0=266(x), r1=30(y), r2=22(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 30
LDI r2, 22
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
