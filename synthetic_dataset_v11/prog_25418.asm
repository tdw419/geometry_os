; DESCRIPTION: Places a black circle of radius 64 at center (157, 129).
; PLAN: r0=157(x), r1=129(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 129
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
