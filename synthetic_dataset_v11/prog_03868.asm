; DESCRIPTION: Renders a purple disk with center (56, 191) and radius 26.
; PLAN: r0=56(x), r1=191(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 191
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
