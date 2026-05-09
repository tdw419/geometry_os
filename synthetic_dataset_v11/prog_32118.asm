; DESCRIPTION: Places a green circle of radius 31 at center (130, 199).
; PLAN: r0=130(x), r1=199(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 199
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
