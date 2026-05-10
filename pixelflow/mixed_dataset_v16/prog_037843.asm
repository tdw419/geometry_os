; DESCRIPTION: Places a black circle of radius 12 at center (204, 163).
; PLAN: r0=204(x), r1=163(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 163
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
