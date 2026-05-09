; DESCRIPTION: Draws a black rectangle at (142, 49) with width 89 and height 67.
; PLAN: r0=142(x), r1=49(y), r2=89(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 49
LDI r2, 89
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
