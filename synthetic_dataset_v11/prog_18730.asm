; DESCRIPTION: Draws a purple rectangle at (135, 83) with width 23 and height 115.
; PLAN: r0=135(x), r1=83(y), r2=23(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 83
LDI r2, 23
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
