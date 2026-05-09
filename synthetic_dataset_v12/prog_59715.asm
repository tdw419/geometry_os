; DESCRIPTION: Renders a yellow disk with center (341, 146) and radius 59.
; PLAN: r0=341(x), r1=146(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 146
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
