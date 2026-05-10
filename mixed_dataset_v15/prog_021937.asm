; DESCRIPTION: Renders a yellow disk with center (487, 49) and radius 17.
; PLAN: r0=487(x), r1=49(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 487
LDI r1, 49
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
