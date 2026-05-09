; DESCRIPTION: Draws a purple rectangle at (70, 119) with width 69 and height 69.
; PLAN: r0=70(x), r1=119(y), r2=69(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 119
LDI r2, 69
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
