; DESCRIPTION: Creates a purple circular shape at (112, 112) with radius 19.
; PLAN: r0=112(x), r1=112(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 112
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
