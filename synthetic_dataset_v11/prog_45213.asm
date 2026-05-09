; DESCRIPTION: Draws a green rectangle at (22, 79) with width 112 and height 81.
; PLAN: r0=22(x), r1=79(y), r2=112(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 79
LDI r2, 112
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
