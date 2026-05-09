; DESCRIPTION: Places a black circle of radius 72 at center (373, 121).
; PLAN: r0=373(x), r1=121(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 121
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
