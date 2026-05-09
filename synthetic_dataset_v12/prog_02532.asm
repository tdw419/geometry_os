; DESCRIPTION: Creates a purple circular shape at (407, 80) with radius 58.
; PLAN: r0=407(x), r1=80(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 80
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
