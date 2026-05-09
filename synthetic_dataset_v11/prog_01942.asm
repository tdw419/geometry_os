; DESCRIPTION: Renders a black disk with center (97, 126) and radius 80.
; PLAN: r0=97(x), r1=126(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 126
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
