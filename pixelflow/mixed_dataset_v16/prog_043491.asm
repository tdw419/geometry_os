; DESCRIPTION: Draws a purple rectangle at (19, 61) with width 53 and height 35.
; PLAN: r0=19(x), r1=61(y), r2=53(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 61
LDI r2, 53
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
