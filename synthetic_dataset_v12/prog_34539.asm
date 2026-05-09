; DESCRIPTION: Places a black circle of radius 55 at center (389, 71).
; PLAN: r0=389(x), r1=71(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 71
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
