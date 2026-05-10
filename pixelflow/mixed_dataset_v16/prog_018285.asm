; DESCRIPTION: Places a black circle of radius 54 at center (438, 80).
; PLAN: r0=438(x), r1=80(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 80
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
