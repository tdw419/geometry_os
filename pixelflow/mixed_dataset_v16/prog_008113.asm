; DESCRIPTION: Renders a white disk with center (418, 147) and radius 50.
; PLAN: r0=418(x), r1=147(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 147
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
