; DESCRIPTION: Renders a yellow disk with center (75, 38) and radius 34.
; PLAN: r0=75(x), r1=38(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 38
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
