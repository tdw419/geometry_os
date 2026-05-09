; DESCRIPTION: Places a black circle of radius 32 at center (245, 77).
; PLAN: r0=245(x), r1=77(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 77
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
