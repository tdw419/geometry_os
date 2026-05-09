; DESCRIPTION: Renders a red disk with center (139, 147) and radius 79.
; PLAN: r0=139(x), r1=147(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 147
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
