; DESCRIPTION: Places a green circle of radius 57 at center (274, 122).
; PLAN: r0=274(x), r1=122(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 122
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
