; DESCRIPTION: Draws a yellow rectangle at (151, 162) with width 69 and height 26.
; PLAN: r0=151(x), r1=162(y), r2=69(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 162
LDI r2, 69
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
