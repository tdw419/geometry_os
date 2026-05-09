; DESCRIPTION: Renders a yellow disk with center (193, 11) and radius 10.
; PLAN: r0=193(x), r1=11(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 11
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
