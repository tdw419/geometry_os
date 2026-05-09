; DESCRIPTION: Renders a green disk with center (100, 199) and radius 21.
; PLAN: r0=100(x), r1=199(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 199
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
