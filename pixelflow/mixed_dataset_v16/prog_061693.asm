; DESCRIPTION: Renders a yellow disk with center (112, 95) and radius 75.
; PLAN: r0=112(x), r1=95(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 95
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
