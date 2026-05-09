; DESCRIPTION: Renders a yellow disk with center (417, 151) and radius 75.
; PLAN: r0=417(x), r1=151(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 151
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
