; DESCRIPTION: Renders a black disk with center (177, 65) and radius 49.
; PLAN: r0=177(x), r1=65(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 65
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
