; DESCRIPTION: Renders a green disk with center (245, 100) and radius 56.
; PLAN: r0=245(x), r1=100(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 100
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
