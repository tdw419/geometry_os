; DESCRIPTION: Draws a black rectangle at (162, 36) with width 119 and height 117.
; PLAN: r0=162(x), r1=36(y), r2=119(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 36
LDI r2, 119
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
