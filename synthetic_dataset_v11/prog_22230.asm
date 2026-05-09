; DESCRIPTION: Places a green circle of radius 44 at center (151, 45).
; PLAN: r0=151(x), r1=45(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 45
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
