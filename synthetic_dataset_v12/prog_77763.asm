; DESCRIPTION: Places a black circle of radius 37 at center (52, 106).
; PLAN: r0=52(x), r1=106(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 106
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
