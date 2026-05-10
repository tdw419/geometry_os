; DESCRIPTION: Creates a purple circular shape at (51, 113) with radius 44.
; PLAN: r0=51(x), r1=113(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 113
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
