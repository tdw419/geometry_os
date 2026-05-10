; DESCRIPTION: Renders a purple circular shape at (1, 80) with radius 40.
; PLAN: r0=1(x), r1=80(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 1
LDI r1, 80
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
