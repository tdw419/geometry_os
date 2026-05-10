; DESCRIPTION: Draws a purple rectangle at (314, 191) with width 67 and height 24.
; PLAN: r0=314(x), r1=191(y), r2=67(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 191
LDI r2, 67
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
