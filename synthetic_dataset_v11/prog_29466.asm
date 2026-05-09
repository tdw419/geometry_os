; DESCRIPTION: Renders a green disk with center (147, 148) and radius 55.
; PLAN: r0=147(x), r1=148(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 148
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
