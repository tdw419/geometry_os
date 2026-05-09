; DESCRIPTION: Places a green circle of radius 57 at center (131, 124).
; PLAN: r0=131(x), r1=124(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 124
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
