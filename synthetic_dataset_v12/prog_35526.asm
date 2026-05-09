; DESCRIPTION: Places a green circle of radius 24 at center (93, 46).
; PLAN: r0=93(x), r1=46(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 46
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
