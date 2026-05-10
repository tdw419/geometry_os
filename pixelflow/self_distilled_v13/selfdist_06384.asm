; DESCRIPTION: Renders a purple circular shape at (30, 48) with radius 80.
; PLAN: r0=30(x), r1=48(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 48
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
