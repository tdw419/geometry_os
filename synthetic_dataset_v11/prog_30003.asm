; DESCRIPTION: Renders a purple disk with center (234, 124) and radius 22.
; PLAN: r0=234(x), r1=124(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 124
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
