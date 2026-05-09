; DESCRIPTION: Renders a yellow disk with center (204, 107) and radius 52.
; PLAN: r0=204(x), r1=107(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 107
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
