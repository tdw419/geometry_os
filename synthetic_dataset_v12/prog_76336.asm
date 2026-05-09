; DESCRIPTION: Renders a blue box of size 108x112 starting at (348, 141).
; PLAN: r0=348(x), r1=141(y), r2=108(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 141
LDI r2, 108
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
