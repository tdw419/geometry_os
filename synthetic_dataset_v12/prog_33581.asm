; DESCRIPTION: Places a black circle of radius 33 at center (455, 39).
; PLAN: r0=455(x), r1=39(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 39
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
