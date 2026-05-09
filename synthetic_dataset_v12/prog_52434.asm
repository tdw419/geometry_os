; DESCRIPTION: Places a green circle of radius 78 at center (402, 148).
; PLAN: r0=402(x), r1=148(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 148
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
