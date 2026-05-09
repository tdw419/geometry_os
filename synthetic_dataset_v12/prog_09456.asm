; DESCRIPTION: Draws a purple rectangle at (37, 122) with width 53 and height 52.
; PLAN: r0=37(x), r1=122(y), r2=53(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 122
LDI r2, 53
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
