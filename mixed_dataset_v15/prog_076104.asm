; DESCRIPTION: Renders a red box of size 100x88 starting at (312, 10).
; PLAN: r0=312(x), r1=10(y), r2=100(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 10
LDI r2, 100
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
