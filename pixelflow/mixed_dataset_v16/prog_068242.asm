; DESCRIPTION: Renders a yellow disk with center (341, 164) and radius 76.
; PLAN: r0=341(x), r1=164(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 164
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
