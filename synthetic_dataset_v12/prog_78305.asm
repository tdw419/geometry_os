; DESCRIPTION: Draws a white rectangle at (314, 0) with width 51 and height 88.
; PLAN: r0=314(x), r1=0(y), r2=51(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 0
LDI r2, 51
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
