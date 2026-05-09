; DESCRIPTION: Places a black circle of radius 61 at center (140, 101).
; PLAN: r0=140(x), r1=101(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 101
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
