; DESCRIPTION: Draws a yellow rectangle at (390, 81) with width 34 and height 35.
; PLAN: r0=390(x), r1=81(y), r2=34(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 81
LDI r2, 34
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
