; DESCRIPTION: Creates a purple circular shape at (318, 147) with radius 51.
; PLAN: r0=318(x), r1=147(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 147
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
