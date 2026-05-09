; DESCRIPTION: Creates a purple circular shape at (83, 174) with radius 60.
; PLAN: r0=83(x), r1=174(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 174
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
