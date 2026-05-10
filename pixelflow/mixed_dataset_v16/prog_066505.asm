; DESCRIPTION: Renders a yellow disk with center (468, 144) and radius 10.
; PLAN: r0=468(x), r1=144(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 144
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
