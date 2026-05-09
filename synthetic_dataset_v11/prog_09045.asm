; DESCRIPTION: Renders a yellow disk with center (131, 134) and radius 17.
; PLAN: r0=131(x), r1=134(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 134
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
