; DESCRIPTION: Renders a blue disk with center (343, 153) and radius 21.
; PLAN: r0=343(x), r1=153(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 153
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
