; DESCRIPTION: Places a black circle of radius 32 at center (148, 129).
; PLAN: r0=148(x), r1=129(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 129
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
