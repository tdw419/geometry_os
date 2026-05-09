; DESCRIPTION: Draws a white rectangle at (1, 147) with width 88 and height 73.
; PLAN: r0=1(x), r1=147(y), r2=88(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 147
LDI r2, 88
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
