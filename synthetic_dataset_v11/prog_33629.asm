; DESCRIPTION: Draws a white rectangle at (88, 113) with width 85 and height 22.
; PLAN: r0=88(x), r1=113(y), r2=85(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 113
LDI r2, 85
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
