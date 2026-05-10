; DESCRIPTION: Renders a black disk with center (199, 76) and radius 65.
; PLAN: r0=199(x), r1=76(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 76
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
