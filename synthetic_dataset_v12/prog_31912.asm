; DESCRIPTION: Renders a black disk with center (323, 126) and radius 65.
; PLAN: r0=323(x), r1=126(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 126
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
