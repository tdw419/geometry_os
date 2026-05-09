; DESCRIPTION: Draws a purple rectangle at (121, 70) with width 62 and height 110.
; PLAN: r0=121(x), r1=70(y), r2=62(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 70
LDI r2, 62
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
