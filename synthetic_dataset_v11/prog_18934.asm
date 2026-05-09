; DESCRIPTION: Places a green circle of radius 79 at center (109, 139).
; PLAN: r0=109(x), r1=139(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 139
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
