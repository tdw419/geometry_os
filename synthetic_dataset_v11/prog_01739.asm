; DESCRIPTION: Renders a yellow box of size 100x38 starting at (88, 179).
; PLAN: r0=88(x), r1=179(y), r2=100(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 179
LDI r2, 100
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
