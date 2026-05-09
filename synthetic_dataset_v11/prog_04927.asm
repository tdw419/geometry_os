; DESCRIPTION: Draws a purple rectangle at (136, 68) with width 32 and height 67.
; PLAN: r0=136(x), r1=68(y), r2=32(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 68
LDI r2, 32
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
