; DESCRIPTION: Renders a blue disk with center (124, 65) and radius 45.
; PLAN: r0=124(x), r1=65(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 65
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
