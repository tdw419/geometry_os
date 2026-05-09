; DESCRIPTION: Places a black circle of radius 18 at center (433, 138).
; PLAN: r0=433(x), r1=138(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 138
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
