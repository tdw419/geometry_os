; DESCRIPTION: Places a black circle of radius 64 at center (141, 184).
; PLAN: r0=141(x), r1=184(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 184
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
