; DESCRIPTION: Renders a black disk with center (200, 202) and radius 44.
; PLAN: r0=200(x), r1=202(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 202
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
