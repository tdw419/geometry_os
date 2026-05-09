; DESCRIPTION: Draws a purple rectangle at (102, 167) with width 67 and height 78.
; PLAN: r0=102(x), r1=167(y), r2=67(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 167
LDI r2, 67
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
