; DESCRIPTION: Renders a purple circular shape at (273, 89) with radius 55.
; PLAN: r0=273(x), r1=89(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 89
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
