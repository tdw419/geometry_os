; DESCRIPTION: Renders a red disk with center (119, 189) and radius 19.
; PLAN: r0=119(x), r1=189(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 189
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
