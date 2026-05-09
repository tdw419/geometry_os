; DESCRIPTION: Renders a black disk with center (447, 131) and radius 17.
; PLAN: r0=447(x), r1=131(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 131
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
