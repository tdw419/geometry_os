; DESCRIPTION: Places a blue circle of radius 33 at center (112, 130).
; PLAN: r0=112(x), r1=130(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 130
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
