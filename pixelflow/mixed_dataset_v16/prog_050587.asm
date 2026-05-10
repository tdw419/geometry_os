; DESCRIPTION: Draws a purple rectangle at (258, 57) with width 109 and height 67.
; PLAN: r0=258(x), r1=57(y), r2=109(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 57
LDI r2, 109
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
