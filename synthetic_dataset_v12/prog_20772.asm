; DESCRIPTION: Creates a purple circular shape at (365, 147) with radius 72.
; PLAN: r0=365(x), r1=147(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 147
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
