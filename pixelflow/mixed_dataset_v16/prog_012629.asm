; DESCRIPTION: Places a black circle of radius 22 at center (100, 101).
; PLAN: r0=100(x), r1=101(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 101
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
