; DESCRIPTION: Draws a black rectangle at (136, 88) with width 47 and height 57.
; PLAN: r0=136(x), r1=88(y), r2=47(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 88
LDI r2, 47
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
