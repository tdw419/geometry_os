; DESCRIPTION: Renders a orange disk with center (342, 147) and radius 61.
; PLAN: r0=342(x), r1=147(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 147
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
