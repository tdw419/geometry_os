; DESCRIPTION: Places a black circle of radius 66 at center (190, 89).
; PLAN: r0=190(x), r1=89(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 89
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
