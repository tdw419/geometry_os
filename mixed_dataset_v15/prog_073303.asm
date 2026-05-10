; DESCRIPTION: Places a black circle of radius 80 at center (376, 102).
; PLAN: r0=376(x), r1=102(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 102
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
