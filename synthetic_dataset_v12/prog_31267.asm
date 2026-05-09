; DESCRIPTION: Renders a white box of size 88x17 starting at (78, 104).
; PLAN: r0=78(x), r1=104(y), r2=88(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 104
LDI r2, 88
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
