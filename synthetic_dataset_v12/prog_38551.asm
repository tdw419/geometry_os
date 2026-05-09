; DESCRIPTION: Draws a white rectangle at (100, 88) with width 81 and height 85.
; PLAN: r0=100(x), r1=88(y), r2=81(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 88
LDI r2, 81
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
