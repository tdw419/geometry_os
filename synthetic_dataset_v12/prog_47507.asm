; DESCRIPTION: Renders a black disk with center (74, 193) and radius 44.
; PLAN: r0=74(x), r1=193(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 193
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
