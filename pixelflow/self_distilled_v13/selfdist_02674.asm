; DESCRIPTION: Places a white disk with center (36, 147) and radius 79.
; PLAN: r0=36(x), r1=147(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 147
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
