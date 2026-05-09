; DESCRIPTION: Renders a black disk with center (195, 223) and radius 21.
; PLAN: r0=195(x), r1=223(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 223
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
