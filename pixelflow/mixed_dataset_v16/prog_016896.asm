; DESCRIPTION: Places a black circle of radius 46 at center (338, 136).
; PLAN: r0=338(x), r1=136(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 136
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
