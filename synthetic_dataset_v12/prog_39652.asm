; DESCRIPTION: Renders a black disk with center (455, 190) and radius 26.
; PLAN: r0=455(x), r1=190(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 190
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
