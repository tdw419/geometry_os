; DESCRIPTION: Draws a black rectangle at (18, 75) with width 67 and height 116.
; PLAN: r0=18(x), r1=75(y), r2=67(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 75
LDI r2, 67
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
