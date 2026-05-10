; DESCRIPTION: Places a black circle of radius 29 at center (389, 137).
; PLAN: r0=389(x), r1=137(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 137
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
