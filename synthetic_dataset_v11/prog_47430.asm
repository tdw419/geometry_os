; DESCRIPTION: Draws a black rectangle at (196, 136) with width 54 and height 69.
; PLAN: r0=196(x), r1=136(y), r2=54(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 136
LDI r2, 54
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
