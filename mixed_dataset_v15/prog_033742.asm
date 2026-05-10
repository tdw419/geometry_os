; DESCRIPTION: Renders a black disk with center (199, 160) and radius 67.
; PLAN: r0=199(x), r1=160(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 160
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
