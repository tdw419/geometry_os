; DESCRIPTION: Places a yellow circle of radius 57 at center (319, 130).
; PLAN: r0=319(x), r1=130(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 130
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
