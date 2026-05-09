; DESCRIPTION: Draws a purple rectangle at (162, 21) with width 26 and height 115.
; PLAN: r0=162(x), r1=21(y), r2=26(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 21
LDI r2, 26
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
