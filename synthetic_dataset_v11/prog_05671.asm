; DESCRIPTION: Renders a yellow disk with center (100, 89) and radius 32.
; PLAN: r0=100(x), r1=89(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 89
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
