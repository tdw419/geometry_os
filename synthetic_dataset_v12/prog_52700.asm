; DESCRIPTION: Draws a black rectangle at (67, 58) with width 94 and height 94.
; PLAN: r0=67(x), r1=58(y), r2=94(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 58
LDI r2, 94
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
