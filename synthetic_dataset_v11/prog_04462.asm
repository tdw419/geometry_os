; DESCRIPTION: Places a black circle of radius 53 at center (109, 136).
; PLAN: r0=109(x), r1=136(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 136
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
