; DESCRIPTION: Renders a yellow disk with center (118, 94) and radius 36.
; PLAN: r0=118(x), r1=94(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 94
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
