; DESCRIPTION: Draws a white rectangle at (30, 53) with width 88 and height 89.
; PLAN: r0=30(x), r1=53(y), r2=88(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 53
LDI r2, 88
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
