; DESCRIPTION: Renders a red disk with center (390, 129) and radius 77.
; PLAN: r0=390(x), r1=129(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 129
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
