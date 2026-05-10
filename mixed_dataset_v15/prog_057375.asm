; DESCRIPTION: Places a black circle of radius 21 at center (351, 98).
; PLAN: r0=351(x), r1=98(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 98
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
