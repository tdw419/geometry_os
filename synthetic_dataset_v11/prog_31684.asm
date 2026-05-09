; DESCRIPTION: Places a green circle of radius 44 at center (53, 160).
; PLAN: r0=53(x), r1=160(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 160
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
