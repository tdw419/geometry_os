; DESCRIPTION: Renders a red disk with center (441, 201) and radius 51.
; PLAN: r0=441(x), r1=201(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 201
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
