; DESCRIPTION: Draws a purple rectangle at (41, 161) with width 92 and height 67.
; PLAN: r0=41(x), r1=161(y), r2=92(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 161
LDI r2, 92
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
