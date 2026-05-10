; DESCRIPTION: Renders a white disk with center (407, 153) and radius 58.
; PLAN: r0=407(x), r1=153(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 153
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
