; DESCRIPTION: Renders a black disk with center (449, 117) and radius 22.
; PLAN: r0=449(x), r1=117(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 117
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
