; DESCRIPTION: Places a black circle of radius 75 at center (357, 89).
; PLAN: r0=357(x), r1=89(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 89
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
