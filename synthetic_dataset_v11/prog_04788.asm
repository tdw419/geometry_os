; DESCRIPTION: Renders a white box of size 88x104 starting at (38, 20).
; PLAN: r0=38(x), r1=20(y), r2=88(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 20
LDI r2, 88
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
