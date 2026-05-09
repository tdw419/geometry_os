; DESCRIPTION: Renders a yellow disk with center (110, 124) and radius 73.
; PLAN: r0=110(x), r1=124(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 124
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
