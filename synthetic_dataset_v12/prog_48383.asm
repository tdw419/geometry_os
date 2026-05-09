; DESCRIPTION: Renders a black disk with center (235, 88) and radius 38.
; PLAN: r0=235(x), r1=88(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 88
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
