; DESCRIPTION: Renders a yellow disk with center (254, 77) and radius 24.
; PLAN: r0=254(x), r1=77(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 77
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
