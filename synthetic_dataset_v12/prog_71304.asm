; DESCRIPTION: Renders a yellow disk with center (441, 92) and radius 50.
; PLAN: r0=441(x), r1=92(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 92
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
