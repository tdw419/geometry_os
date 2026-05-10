; DESCRIPTION: Draws a yellow rectangle at (13, 162) with width 49 and height 35.
; PLAN: r0=13(x), r1=162(y), r2=49(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 162
LDI r2, 49
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
