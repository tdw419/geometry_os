; DESCRIPTION: Places a black circle of radius 22 at center (166, 44).
; PLAN: r0=166(x), r1=44(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 44
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
