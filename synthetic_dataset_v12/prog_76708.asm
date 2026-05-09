; DESCRIPTION: Draws a yellow rectangle at (162, 92) with width 117 and height 35.
; PLAN: r0=162(x), r1=92(y), r2=117(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 92
LDI r2, 117
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
