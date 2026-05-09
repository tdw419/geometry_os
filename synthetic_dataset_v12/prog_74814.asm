; DESCRIPTION: Renders a black disk with center (199, 86) and radius 63.
; PLAN: r0=199(x), r1=86(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 86
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
