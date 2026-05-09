; DESCRIPTION: Creates a purple circular shape at (83, 102) with radius 77.
; PLAN: r0=83(x), r1=102(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 102
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
