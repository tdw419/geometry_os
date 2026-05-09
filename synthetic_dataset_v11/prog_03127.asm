; DESCRIPTION: Draws a purple rectangle at (72, 123) with width 31 and height 115.
; PLAN: r0=72(x), r1=123(y), r2=31(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 123
LDI r2, 31
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
