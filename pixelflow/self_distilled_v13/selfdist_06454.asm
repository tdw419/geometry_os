; DESCRIPTION: Renders a purple circular shape at (83, 82) with radius 21.
; PLAN: r0=83(x), r1=82(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 82
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
