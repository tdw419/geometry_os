; DESCRIPTION: Places a black circle of radius 13 at center (31, 189).
; PLAN: r0=31(x), r1=189(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 189
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
