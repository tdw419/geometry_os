; DESCRIPTION: Places a green circle of radius 13 at center (323, 129).
; PLAN: r0=323(x), r1=129(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 129
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
