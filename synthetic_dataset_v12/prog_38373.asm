; DESCRIPTION: Renders a yellow disk with center (419, 96) and radius 54.
; PLAN: r0=419(x), r1=96(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 96
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
