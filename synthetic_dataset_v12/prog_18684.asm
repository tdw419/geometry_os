; DESCRIPTION: Renders a red disk with center (409, 147) and radius 40.
; PLAN: r0=409(x), r1=147(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 147
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
