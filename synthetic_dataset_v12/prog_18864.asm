; DESCRIPTION: Draws a white rectangle at (381, 18) with width 102 and height 88.
; PLAN: r0=381(x), r1=18(y), r2=102(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 18
LDI r2, 102
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
