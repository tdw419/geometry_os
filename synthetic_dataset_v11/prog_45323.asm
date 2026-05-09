; DESCRIPTION: Draws a white rectangle at (89, 26) with width 88 and height 35.
; PLAN: r0=89(x), r1=26(y), r2=88(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 26
LDI r2, 88
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
