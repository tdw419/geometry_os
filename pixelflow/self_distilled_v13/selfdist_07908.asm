; DESCRIPTION: Draws a purple rectangle at (122, 94) with width 100 and height 70.
; PLAN: r0=122(x), r1=94(y), r2=100(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 94
LDI r2, 100
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
