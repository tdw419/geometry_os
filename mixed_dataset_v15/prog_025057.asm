; DESCRIPTION: Places a black circle of radius 46 at center (66, 129).
; PLAN: r0=66(x), r1=129(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 129
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
