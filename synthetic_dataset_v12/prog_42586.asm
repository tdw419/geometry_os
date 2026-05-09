; DESCRIPTION: Renders a black disk with center (417, 197) and radius 10.
; PLAN: r0=417(x), r1=197(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 197
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
