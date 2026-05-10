; DESCRIPTION: Draws a purple rectangle at (178, 67) with width 19 and height 76.
; PLAN: r0=178(x), r1=67(y), r2=19(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 67
LDI r2, 19
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
