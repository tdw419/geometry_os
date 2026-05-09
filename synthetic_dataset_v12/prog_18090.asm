; DESCRIPTION: Places a yellow circle of radius 65 at center (417, 129).
; PLAN: r0=417(x), r1=129(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 129
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
