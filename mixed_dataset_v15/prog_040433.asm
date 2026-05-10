; DESCRIPTION: Renders a purple circular shape at (297, 101) with radius 48.
; PLAN: r0=297(x), r1=101(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 101
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
