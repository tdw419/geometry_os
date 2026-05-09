; DESCRIPTION: Creates a purple circular shape at (51, 125) with radius 31.
; PLAN: r0=51(x), r1=125(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 125
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
