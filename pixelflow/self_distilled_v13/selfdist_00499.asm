; DESCRIPTION: Renders a purple circular shape at (132, 54) with radius 64.
; PLAN: r0=132(x), r1=54(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 54
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
