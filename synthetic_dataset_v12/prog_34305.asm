; DESCRIPTION: Renders a yellow disk with center (108, 81) and radius 73.
; PLAN: r0=108(x), r1=81(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 81
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
