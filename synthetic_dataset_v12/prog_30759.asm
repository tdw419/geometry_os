; DESCRIPTION: Places a black circle of radius 63 at center (76, 106).
; PLAN: r0=76(x), r1=106(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 106
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
