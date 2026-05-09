; DESCRIPTION: Renders a red box of size 116x88 starting at (109, 51).
; PLAN: r0=109(x), r1=51(y), r2=116(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 51
LDI r2, 116
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
