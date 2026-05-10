; DESCRIPTION: Renders a blue circular shape at (147, 191) with radius 17.
; PLAN: r0=147(x), r1=191(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 191
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
