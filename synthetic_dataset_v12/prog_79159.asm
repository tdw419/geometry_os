; DESCRIPTION: Renders a red box of size 58x119 starting at (124, 5).
; PLAN: r0=124(x), r1=5(y), r2=58(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 5
LDI r2, 58
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
