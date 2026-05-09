; DESCRIPTION: Renders a yellow disk with center (90, 192) and radius 61.
; PLAN: r0=90(x), r1=192(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 192
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
