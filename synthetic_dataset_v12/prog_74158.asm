; DESCRIPTION: Renders a yellow disk with center (190, 119) and radius 61.
; PLAN: r0=190(x), r1=119(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 119
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
