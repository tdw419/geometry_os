; DESCRIPTION: Renders a yellow disk with center (235, 218) and radius 29.
; PLAN: r0=235(x), r1=218(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 218
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
