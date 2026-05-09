; DESCRIPTION: Renders a yellow disk with center (165, 118) and radius 43.
; PLAN: r0=165(x), r1=118(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 118
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
