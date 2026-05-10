; DESCRIPTION: Renders a purple circular shape at (10, 142) with radius 70.
; PLAN: r0=10(x), r1=142(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 10
LDI r1, 142
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
