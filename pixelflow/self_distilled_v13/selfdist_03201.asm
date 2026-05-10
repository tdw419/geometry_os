; DESCRIPTION: Draws a purple rectangle at (300, 135) with width 64 and height 67.
; PLAN: r0=300(x), r1=135(y), r2=64(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 135
LDI r2, 64
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
