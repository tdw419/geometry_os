; DESCRIPTION: Renders a purple circular shape at (114, 89) with radius 47.
; PLAN: r0=114(x), r1=89(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 89
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
