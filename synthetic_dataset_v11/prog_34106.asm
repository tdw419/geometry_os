; DESCRIPTION: Renders a yellow disk with center (169, 92) and radius 14.
; PLAN: r0=169(x), r1=92(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 92
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
