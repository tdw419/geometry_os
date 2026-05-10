; DESCRIPTION: Renders a yellow disk with center (353, 107) and radius 46.
; PLAN: r0=353(x), r1=107(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 107
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
