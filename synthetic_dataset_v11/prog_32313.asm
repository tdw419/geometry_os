; DESCRIPTION: Draws a purple rectangle at (70, 160) with width 78 and height 69.
; PLAN: r0=70(x), r1=160(y), r2=78(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 160
LDI r2, 78
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
