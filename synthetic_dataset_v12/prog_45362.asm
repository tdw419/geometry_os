; DESCRIPTION: Creates a purple circular shape at (348, 194) with radius 51.
; PLAN: r0=348(x), r1=194(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 194
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
