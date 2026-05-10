; DESCRIPTION: Places a black circle of radius 75 at center (289, 82).
; PLAN: r0=289(x), r1=82(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 82
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
