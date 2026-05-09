; DESCRIPTION: Renders a black disk with center (391, 32) and radius 12.
; PLAN: r0=391(x), r1=32(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 32
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
