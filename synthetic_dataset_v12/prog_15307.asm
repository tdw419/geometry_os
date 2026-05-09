; DESCRIPTION: Draws a black rectangle at (181, 167) with width 67 and height 88.
; PLAN: r0=181(x), r1=167(y), r2=67(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 167
LDI r2, 67
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
