; DESCRIPTION: Renders a black disk with center (319, 162) and radius 13.
; PLAN: r0=319(x), r1=162(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 162
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
