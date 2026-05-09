; DESCRIPTION: Places a black circle of radius 46 at center (381, 62).
; PLAN: r0=381(x), r1=62(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 62
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
