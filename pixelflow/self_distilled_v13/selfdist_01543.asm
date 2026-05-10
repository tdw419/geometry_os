; DESCRIPTION: Renders a purple circular shape at (289, 31) with radius 25.
; PLAN: r0=289(x), r1=31(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 31
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
