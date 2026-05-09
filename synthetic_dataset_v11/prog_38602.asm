; DESCRIPTION: Renders a purple disk with center (136, 191) and radius 63.
; PLAN: r0=136(x), r1=191(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 191
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
