; DESCRIPTION: Renders a yellow disk with center (441, 88) and radius 49.
; PLAN: r0=441(x), r1=88(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 88
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
