; DESCRIPTION: Renders a black disk with center (131, 57) and radius 51.
; PLAN: r0=131(x), r1=57(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 57
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
