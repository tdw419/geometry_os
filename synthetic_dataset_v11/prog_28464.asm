; DESCRIPTION: Renders a yellow disk with center (147, 82) and radius 69.
; PLAN: r0=147(x), r1=82(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 82
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
