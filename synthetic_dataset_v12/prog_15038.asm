; DESCRIPTION: Composite: Renders a orange disk with center (363, 131) and radius 44 then Sets a single white pixel at (488, 99).
; PLAN: r0=363(x), r1=131(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=99(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 363
LDI r1, 131
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 99
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
