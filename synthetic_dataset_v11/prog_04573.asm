; DESCRIPTION: Draws a white rectangle at (14, 5) with width 76 and height 88.
; PLAN: r0=14(x), r1=5(y), r2=76(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 5
LDI r2, 76
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
