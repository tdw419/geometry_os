; DESCRIPTION: Creates a purple circular shape at (234, 119) with radius 77.
; PLAN: r0=234(x), r1=119(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 119
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
