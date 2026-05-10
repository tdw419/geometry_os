; DESCRIPTION: Renders a purple circular shape at (56, 49) with radius 16.
; PLAN: r0=56(x), r1=49(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 49
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
