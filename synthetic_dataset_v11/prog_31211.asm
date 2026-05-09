; DESCRIPTION: Places a black circle of radius 61 at center (83, 171).
; PLAN: r0=83(x), r1=171(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 171
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
