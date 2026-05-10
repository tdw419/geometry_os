; DESCRIPTION: Places a black circle of radius 36 at center (275, 44).
; PLAN: r0=275(x), r1=44(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 44
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
