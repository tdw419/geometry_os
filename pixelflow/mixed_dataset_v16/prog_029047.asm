; DESCRIPTION: Creates a yellow rectangular region at (348, 137) spanning 32 by 89 pixels.
; PLAN: r0=348(x), r1=137(y), r2=32(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 137
LDI r2, 32
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
