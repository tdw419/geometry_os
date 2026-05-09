; DESCRIPTION: Places a black circle of radius 75 at center (98, 170).
; PLAN: r0=98(x), r1=170(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 170
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
