; DESCRIPTION: Draws a black rectangle at (101, 136) with width 116 and height 68.
; PLAN: r0=101(x), r1=136(y), r2=116(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 136
LDI r2, 116
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
