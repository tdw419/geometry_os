; DESCRIPTION: Draws a purple rectangle at (385, 68) with width 74 and height 15.
; PLAN: r0=385(x), r1=68(y), r2=74(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 68
LDI r2, 74
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
