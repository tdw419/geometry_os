; DESCRIPTION: Places a black circle of radius 41 at center (225, 82).
; PLAN: r0=225(x), r1=82(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 82
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
