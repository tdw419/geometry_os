; DESCRIPTION: Places a black circle of radius 40 at center (302, 140).
; PLAN: r0=302(x), r1=140(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 140
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
