; DESCRIPTION: Draws a purple rectangle at (10, 67) with width 64 and height 86.
; PLAN: r0=10(x), r1=67(y), r2=64(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 67
LDI r2, 64
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
