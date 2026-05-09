; DESCRIPTION: Renders a yellow disk with center (413, 118) and radius 35.
; PLAN: r0=413(x), r1=118(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 118
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
