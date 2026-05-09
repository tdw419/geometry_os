; DESCRIPTION: Places a black circle of radius 17 at center (274, 142).
; PLAN: r0=274(x), r1=142(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 142
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
