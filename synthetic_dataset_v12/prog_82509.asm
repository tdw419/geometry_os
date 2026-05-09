; DESCRIPTION: Places a green circle of radius 58 at center (314, 66).
; PLAN: r0=314(x), r1=66(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 66
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
