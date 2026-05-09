; DESCRIPTION: Draws a white rectangle at (74, 110) with width 112 and height 74.
; PLAN: r0=74(x), r1=110(y), r2=112(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 110
LDI r2, 112
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
