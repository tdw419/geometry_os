; DESCRIPTION: Renders a black disk with center (248, 212) and radius 12.
; PLAN: r0=248(x), r1=212(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 212
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
