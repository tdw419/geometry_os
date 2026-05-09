; DESCRIPTION: Renders a yellow disk with center (226, 108) and radius 75.
; PLAN: r0=226(x), r1=108(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 108
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
