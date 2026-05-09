; DESCRIPTION: Draws a purple rectangle at (17, 70) with width 108 and height 36.
; PLAN: r0=17(x), r1=70(y), r2=108(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 70
LDI r2, 108
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
