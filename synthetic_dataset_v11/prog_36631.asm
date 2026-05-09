; DESCRIPTION: Places a yellow circle of radius 35 at center (44, 130).
; PLAN: r0=44(x), r1=130(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 130
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
