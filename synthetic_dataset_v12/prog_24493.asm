; DESCRIPTION: Places a black circle of radius 32 at center (471, 66).
; PLAN: r0=471(x), r1=66(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 66
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
