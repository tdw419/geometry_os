; DESCRIPTION: Renders a white box of size 100x22 starting at (14, 4).
; PLAN: r0=14(x), r1=4(y), r2=100(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 4
LDI r2, 100
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
