; DESCRIPTION: Draws a purple rectangle at (67, 144) with width 30 and height 33.
; PLAN: r0=67(x), r1=144(y), r2=30(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 144
LDI r2, 30
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
