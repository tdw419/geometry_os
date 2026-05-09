; DESCRIPTION: Renders a red box of size 114x72 starting at (81, 77).
; PLAN: r0=81(x), r1=77(y), r2=114(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 77
LDI r2, 114
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
