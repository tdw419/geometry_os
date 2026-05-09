; DESCRIPTION: Renders a yellow disk with center (61, 115) and radius 33.
; PLAN: r0=61(x), r1=115(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 115
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
