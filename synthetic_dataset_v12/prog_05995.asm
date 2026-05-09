; DESCRIPTION: Renders a yellow disk with center (118, 140) and radius 57.
; PLAN: r0=118(x), r1=140(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 140
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
