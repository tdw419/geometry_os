; DESCRIPTION: Renders a black disk with center (205, 118) and radius 45.
; PLAN: r0=205(x), r1=118(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 118
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
