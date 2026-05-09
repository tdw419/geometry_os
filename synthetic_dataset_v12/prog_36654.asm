; DESCRIPTION: Renders a white disk with center (361, 157) and radius 58.
; PLAN: r0=361(x), r1=157(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 157
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
