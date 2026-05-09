; DESCRIPTION: Renders a yellow disk with center (105, 92) and radius 59.
; PLAN: r0=105(x), r1=92(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 92
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
