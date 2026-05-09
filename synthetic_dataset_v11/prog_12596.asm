; DESCRIPTION: Renders a yellow disk with center (199, 144) and radius 34.
; PLAN: r0=199(x), r1=144(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 144
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
