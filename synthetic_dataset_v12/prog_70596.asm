; DESCRIPTION: Renders a white disk with center (407, 235) and radius 20.
; PLAN: r0=407(x), r1=235(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 235
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
