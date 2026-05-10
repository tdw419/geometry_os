; DESCRIPTION: Renders a red box of size 35x118 starting at (283, 22).
; PLAN: r0=283(x), r1=22(y), r2=35(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 22
LDI r2, 35
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
