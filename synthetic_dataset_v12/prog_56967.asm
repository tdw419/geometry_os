; DESCRIPTION: Places a green circle of radius 24 at center (129, 63).
; PLAN: r0=129(x), r1=63(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 63
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
