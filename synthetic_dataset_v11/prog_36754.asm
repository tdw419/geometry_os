; DESCRIPTION: Places a black circle of radius 66 at center (105, 141).
; PLAN: r0=105(x), r1=141(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 141
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
