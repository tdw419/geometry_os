; DESCRIPTION: Renders a red box of size 81x38 starting at (1, 56).
; PLAN: r0=1(x), r1=56(y), r2=81(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 56
LDI r2, 81
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
