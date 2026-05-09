; DESCRIPTION: Renders a yellow box of size 87x48 starting at (348, 58).
; PLAN: r0=348(x), r1=58(y), r2=87(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 58
LDI r2, 87
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
