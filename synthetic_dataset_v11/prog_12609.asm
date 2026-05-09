; DESCRIPTION: Draws a green rectangle at (103, 136) with width 101 and height 88.
; PLAN: r0=103(x), r1=136(y), r2=101(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 136
LDI r2, 101
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
