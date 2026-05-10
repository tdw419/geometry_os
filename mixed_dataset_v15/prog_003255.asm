; DESCRIPTION: Renders a yellow disk with center (225, 177) and radius 53.
; PLAN: r0=225(x), r1=177(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 177
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
