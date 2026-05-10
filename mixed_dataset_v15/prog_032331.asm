; DESCRIPTION: Draws a purple rectangle at (37, 135) with width 90 and height 35.
; PLAN: r0=37(x), r1=135(y), r2=90(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 135
LDI r2, 90
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
