; DESCRIPTION: Places a green circle of radius 78 at center (253, 89).
; PLAN: r0=253(x), r1=89(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 89
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
