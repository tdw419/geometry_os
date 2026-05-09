; DESCRIPTION: Renders a red box of size 77x94 starting at (338, 148).
; PLAN: r0=338(x), r1=148(y), r2=77(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 148
LDI r2, 77
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
