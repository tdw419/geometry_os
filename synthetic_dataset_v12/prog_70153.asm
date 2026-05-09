; DESCRIPTION: Renders a purple box of size 102x118 starting at (348, 78).
; PLAN: r0=348(x), r1=78(y), r2=102(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 78
LDI r2, 102
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
