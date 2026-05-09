; DESCRIPTION: Draws a black rectangle at (162, 15) with width 35 and height 44.
; PLAN: r0=162(x), r1=15(y), r2=35(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 15
LDI r2, 35
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
