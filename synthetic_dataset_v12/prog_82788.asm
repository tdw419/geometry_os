; DESCRIPTION: Places a yellow circle of radius 66 at center (142, 130).
; PLAN: r0=142(x), r1=130(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 130
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
