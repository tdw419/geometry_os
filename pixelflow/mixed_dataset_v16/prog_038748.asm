; DESCRIPTION: Renders a yellow disk with center (233, 160) and radius 51.
; PLAN: r0=233(x), r1=160(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 160
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
