; DESCRIPTION: Places a black circle of radius 12 at center (136, 72).
; PLAN: r0=136(x), r1=72(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 72
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
