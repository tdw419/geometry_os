; DESCRIPTION: Renders a purple disk with center (45, 56) and radius 37.
; PLAN: r0=45(x), r1=56(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 56
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
