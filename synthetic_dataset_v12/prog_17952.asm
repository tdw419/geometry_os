; DESCRIPTION: Draws a purple rectangle at (287, 83) with width 101 and height 67.
; PLAN: r0=287(x), r1=83(y), r2=101(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 83
LDI r2, 101
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
