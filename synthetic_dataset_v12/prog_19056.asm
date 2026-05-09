; DESCRIPTION: Places a black circle of radius 36 at center (62, 87).
; PLAN: r0=62(x), r1=87(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 87
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
