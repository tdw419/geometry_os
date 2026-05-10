; DESCRIPTION: Renders a purple circular shape at (361, 142) with radius 14.
; PLAN: r0=361(x), r1=142(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 142
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
