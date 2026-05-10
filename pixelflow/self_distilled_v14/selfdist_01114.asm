; DESCRIPTION: Renders a purple circular shape at (31, 109) with radius 76.
; PLAN: r0=31(x), r1=109(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 109
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
