; DESCRIPTION: Places a black circle of radius 53 at center (266, 133).
; PLAN: r0=266(x), r1=133(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 133
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
