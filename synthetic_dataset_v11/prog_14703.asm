; DESCRIPTION: Draws a black rectangle at (24, 63) with width 88 and height 114.
; PLAN: r0=24(x), r1=63(y), r2=88(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 63
LDI r2, 88
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
