; DESCRIPTION: Draws a purple rectangle at (166, 22) with width 55 and height 35.
; PLAN: r0=166(x), r1=22(y), r2=55(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 22
LDI r2, 55
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
