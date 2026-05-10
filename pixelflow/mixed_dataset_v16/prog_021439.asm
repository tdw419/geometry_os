; DESCRIPTION: Creates a black circular shape at (385, 56) with radius 51.
; PLAN: r0=385(x), r1=56(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 56
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
