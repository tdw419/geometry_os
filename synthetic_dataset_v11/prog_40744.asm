; DESCRIPTION: Renders a red box of size 77x101 starting at (3, 85).
; PLAN: r0=3(x), r1=85(y), r2=77(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 85
LDI r2, 77
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
