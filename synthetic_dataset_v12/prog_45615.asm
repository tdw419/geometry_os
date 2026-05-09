; DESCRIPTION: Places a black circle of radius 13 at center (391, 35).
; PLAN: r0=391(x), r1=35(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 35
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
