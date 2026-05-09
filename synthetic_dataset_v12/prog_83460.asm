; DESCRIPTION: Places a black circle of radius 51 at center (458, 155).
; PLAN: r0=458(x), r1=155(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 155
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
