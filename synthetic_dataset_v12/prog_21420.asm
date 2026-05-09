; DESCRIPTION: Draws a purple rectangle at (67, 76) with width 10 and height 36.
; PLAN: r0=67(x), r1=76(y), r2=10(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 76
LDI r2, 10
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
