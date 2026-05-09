; DESCRIPTION: Renders a yellow disk with center (235, 111) and radius 11.
; PLAN: r0=235(x), r1=111(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 111
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
