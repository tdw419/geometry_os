; DESCRIPTION: Renders a red box of size 77x52 starting at (177, 73).
; PLAN: r0=177(x), r1=73(y), r2=77(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 73
LDI r2, 77
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
