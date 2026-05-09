; DESCRIPTION: Places a black circle of radius 34 at center (195, 142).
; PLAN: r0=195(x), r1=142(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 142
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
