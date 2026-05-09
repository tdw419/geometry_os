; DESCRIPTION: Draws a black rectangle at (67, 227) with width 68 and height 13.
; PLAN: r0=67(x), r1=227(y), r2=68(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 227
LDI r2, 68
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
