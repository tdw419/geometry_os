; DESCRIPTION: Draws a green rectangle at (63, 88) with width 116 and height 73.
; PLAN: r0=63(x), r1=88(y), r2=116(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 88
LDI r2, 116
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
