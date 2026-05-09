; DESCRIPTION: Places a black circle of radius 46 at center (153, 66).
; PLAN: r0=153(x), r1=66(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 66
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
