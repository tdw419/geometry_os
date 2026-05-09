; DESCRIPTION: Renders a yellow disk with center (188, 159) and radius 61.
; PLAN: r0=188(x), r1=159(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 159
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
