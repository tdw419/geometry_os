; DESCRIPTION: Renders a black disk with center (279, 188) and radius 22.
; PLAN: r0=279(x), r1=188(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 188
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
