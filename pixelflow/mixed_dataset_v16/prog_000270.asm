; DESCRIPTION: Renders a purple circular shape at (12, 136) with radius 49.
; PLAN: r0=12(x), r1=136(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 12
LDI r1, 136
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
