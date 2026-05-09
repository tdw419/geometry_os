; DESCRIPTION: Places a black circle of radius 43 at center (400, 51).
; PLAN: r0=400(x), r1=51(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 51
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
