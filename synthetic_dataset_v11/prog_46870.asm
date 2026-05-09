; DESCRIPTION: Renders a purple disk with center (177, 124) and radius 40.
; PLAN: r0=177(x), r1=124(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 124
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
