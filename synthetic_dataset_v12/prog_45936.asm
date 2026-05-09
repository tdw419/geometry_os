; DESCRIPTION: Renders a black disk with center (74, 74) and radius 58.
; PLAN: r0=74(x), r1=74(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 74
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
