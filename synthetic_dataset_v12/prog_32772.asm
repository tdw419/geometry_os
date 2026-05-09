; DESCRIPTION: Places a black circle of radius 74 at center (357, 93).
; PLAN: r0=357(x), r1=93(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 93
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
