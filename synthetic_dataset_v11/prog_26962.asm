; DESCRIPTION: Renders a red box of size 62x101 starting at (112, 18).
; PLAN: r0=112(x), r1=18(y), r2=62(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 18
LDI r2, 62
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
