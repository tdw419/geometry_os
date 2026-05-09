; DESCRIPTION: Places a black circle of radius 21 at center (302, 112).
; PLAN: r0=302(x), r1=112(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 112
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
