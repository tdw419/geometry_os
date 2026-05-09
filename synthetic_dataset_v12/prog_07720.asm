; DESCRIPTION: Places a black circle of radius 24 at center (319, 137).
; PLAN: r0=319(x), r1=137(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 137
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
