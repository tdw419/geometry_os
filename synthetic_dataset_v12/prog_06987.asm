; DESCRIPTION: Draws a purple rectangle at (423, 34) with width 80 and height 69.
; PLAN: r0=423(x), r1=34(y), r2=80(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 34
LDI r2, 80
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
