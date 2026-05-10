; DESCRIPTION: Renders a black disk with center (309, 202) and radius 23.
; PLAN: r0=309(x), r1=202(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 202
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
