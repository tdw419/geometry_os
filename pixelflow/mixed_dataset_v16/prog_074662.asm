; DESCRIPTION: Renders a purple circular shape at (286, 198) with radius 45.
; PLAN: r0=286(x), r1=198(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 198
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
