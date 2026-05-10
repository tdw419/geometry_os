; DESCRIPTION: Renders a black disk with center (449, 164) and radius 19.
; PLAN: r0=449(x), r1=164(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 164
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
