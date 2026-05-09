; DESCRIPTION: Draws a purple rectangle at (40, 9) with width 100 and height 115.
; PLAN: r0=40(x), r1=9(y), r2=100(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 9
LDI r2, 100
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
