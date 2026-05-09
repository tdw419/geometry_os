; DESCRIPTION: Places a black circle of radius 80 at center (221, 119).
; PLAN: r0=221(x), r1=119(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 119
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
