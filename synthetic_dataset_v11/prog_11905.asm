; DESCRIPTION: Places a black circle of radius 26 at center (92, 121).
; PLAN: r0=92(x), r1=121(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 121
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
