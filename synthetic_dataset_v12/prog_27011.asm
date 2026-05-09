; DESCRIPTION: Places a black circle of radius 22 at center (461, 76).
; PLAN: r0=461(x), r1=76(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 76
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
