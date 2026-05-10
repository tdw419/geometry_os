; DESCRIPTION: Creates a green rectangular region at (348, 123) spanning 61 by 119 pixels.
; PLAN: r0=348(x), r1=123(y), r2=61(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 123
LDI r2, 61
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
