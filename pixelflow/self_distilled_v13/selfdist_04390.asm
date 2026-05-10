; DESCRIPTION: Renders a purple circular shape at (361, 84) with radius 79.
; PLAN: r0=361(x), r1=84(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 84
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
