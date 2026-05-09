; DESCRIPTION: Places a black circle of radius 49 at center (131, 86).
; PLAN: r0=131(x), r1=86(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 86
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
