; DESCRIPTION: Draws a purple rectangle at (345, 14) with width 29 and height 70.
; PLAN: r0=345(x), r1=14(y), r2=29(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 14
LDI r2, 29
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
