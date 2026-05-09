; DESCRIPTION: Renders a yellow disk with center (436, 194) and radius 18.
; PLAN: r0=436(x), r1=194(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 194
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
