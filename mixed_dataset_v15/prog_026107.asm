; DESCRIPTION: Draws a cyan circle centered at (348, 10) with radius 72.
; PLAN: r0=348(x), r1=10(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 10
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
