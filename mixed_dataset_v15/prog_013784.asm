; DESCRIPTION: Renders a yellow disk with center (225, 35) and radius 31.
; PLAN: r0=225(x), r1=35(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 35
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
