; DESCRIPTION: Creates a purple circular shape at (230, 112) with radius 49.
; PLAN: r0=230(x), r1=112(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 112
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
