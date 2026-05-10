; DESCRIPTION: Draws a purple rectangle at (110, 139) with width 76 and height 15.
; PLAN: r0=110(x), r1=139(y), r2=76(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 139
LDI r2, 76
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
