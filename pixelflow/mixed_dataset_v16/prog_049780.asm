; DESCRIPTION: Places a black circle of radius 44 at center (189, 159).
; PLAN: r0=189(x), r1=159(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 159
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
