; DESCRIPTION: Renders a yellow disk with center (177, 222) and radius 10.
; PLAN: r0=177(x), r1=222(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 222
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
