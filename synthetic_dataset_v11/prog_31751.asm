; DESCRIPTION: Places a yellow circle of radius 48 at center (188, 130).
; PLAN: r0=188(x), r1=130(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 130
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
