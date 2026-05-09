; DESCRIPTION: Creates a purple circular shape at (177, 112) with radius 75.
; PLAN: r0=177(x), r1=112(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 112
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
