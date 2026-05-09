; DESCRIPTION: Draws a purple rectangle at (37, 67) with width 117 and height 40.
; PLAN: r0=37(x), r1=67(y), r2=117(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 67
LDI r2, 117
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
