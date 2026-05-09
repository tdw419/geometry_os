; DESCRIPTION: Renders a red box of size 102x112 starting at (158, 20).
; PLAN: r0=158(x), r1=20(y), r2=102(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 20
LDI r2, 102
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
