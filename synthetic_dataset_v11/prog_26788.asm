; DESCRIPTION: Renders a black disk with center (177, 124) and radius 36.
; PLAN: r0=177(x), r1=124(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 124
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
