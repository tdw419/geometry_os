; DESCRIPTION: Draws a purple rectangle at (15, 164) with width 106 and height 67.
; PLAN: r0=15(x), r1=164(y), r2=106(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 164
LDI r2, 106
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
