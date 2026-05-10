; DESCRIPTION: Creates a purple circular shape at (53, 51) with radius 47.
; PLAN: r0=53(x), r1=51(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 51
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
