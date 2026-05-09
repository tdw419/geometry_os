; DESCRIPTION: Renders a black box of size 102x115 starting at (348, 10).
; PLAN: r0=348(x), r1=10(y), r2=102(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 10
LDI r2, 102
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
