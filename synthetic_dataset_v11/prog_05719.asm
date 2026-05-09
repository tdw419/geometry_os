; DESCRIPTION: Renders a yellow disk with center (96, 115) and radius 80.
; PLAN: r0=96(x), r1=115(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 115
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
