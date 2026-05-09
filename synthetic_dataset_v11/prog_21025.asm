; DESCRIPTION: Creates a purple circular shape at (82, 147) with radius 63.
; PLAN: r0=82(x), r1=147(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 147
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
