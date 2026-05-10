; DESCRIPTION: Renders a purple circular shape at (351, 159) with radius 21.
; PLAN: r0=351(x), r1=159(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 159
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
