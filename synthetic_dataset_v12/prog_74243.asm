; DESCRIPTION: Draws a white rectangle at (89, 88) with width 103 and height 43.
; PLAN: r0=89(x), r1=88(y), r2=103(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 88
LDI r2, 103
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
