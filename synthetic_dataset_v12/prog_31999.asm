; DESCRIPTION: Places a black circle of radius 76 at center (253, 100).
; PLAN: r0=253(x), r1=100(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 100
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
