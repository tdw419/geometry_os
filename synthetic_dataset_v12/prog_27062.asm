; DESCRIPTION: Renders a blue disk with center (323, 82) and radius 30.
; PLAN: r0=323(x), r1=82(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 82
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
