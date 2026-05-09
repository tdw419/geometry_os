; DESCRIPTION: Places a black circle of radius 13 at center (467, 43).
; PLAN: r0=467(x), r1=43(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 43
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
