; DESCRIPTION: Places a black circle of radius 26 at center (75, 109).
; PLAN: r0=75(x), r1=109(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 109
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
