; DESCRIPTION: Renders a white disk with center (405, 147) and radius 64.
; PLAN: r0=405(x), r1=147(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 147
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
