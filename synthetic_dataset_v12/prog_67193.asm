; DESCRIPTION: Renders a yellow disk with center (433, 92) and radius 66.
; PLAN: r0=433(x), r1=92(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 92
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
