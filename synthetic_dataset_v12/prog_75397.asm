; DESCRIPTION: Renders a blue disk with center (293, 89) and radius 52.
; PLAN: r0=293(x), r1=89(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 89
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
