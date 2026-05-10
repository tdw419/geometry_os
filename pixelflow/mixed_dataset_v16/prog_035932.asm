; DESCRIPTION: Draws a green rectangle at (68, 136) with width 67 and height 81.
; PLAN: r0=68(x), r1=136(y), r2=67(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 136
LDI r2, 67
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
