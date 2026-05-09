; DESCRIPTION: Renders a red box of size 56x77 starting at (74, 96).
; PLAN: r0=74(x), r1=96(y), r2=56(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 96
LDI r2, 56
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
