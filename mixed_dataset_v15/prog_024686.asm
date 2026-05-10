; DESCRIPTION: Places a black circle of radius 43 at center (163, 79).
; PLAN: r0=163(x), r1=79(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 79
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
