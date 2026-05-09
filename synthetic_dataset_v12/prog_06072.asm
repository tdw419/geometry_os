; DESCRIPTION: Places a green circle of radius 73 at center (139, 148).
; PLAN: r0=139(x), r1=148(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 148
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
