; DESCRIPTION: Renders a black disk with center (121, 147) and radius 37.
; PLAN: r0=121(x), r1=147(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 147
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
