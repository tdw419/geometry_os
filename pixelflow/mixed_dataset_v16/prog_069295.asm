; DESCRIPTION: Creates a purple circular shape at (338, 147) with radius 12.
; PLAN: r0=338(x), r1=147(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 147
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
