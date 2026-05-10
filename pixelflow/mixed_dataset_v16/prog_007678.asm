; DESCRIPTION: Places a black circle of radius 77 at center (245, 143).
; PLAN: r0=245(x), r1=143(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 143
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
