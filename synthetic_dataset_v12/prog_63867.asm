; DESCRIPTION: Composite: Renders a purple disk with center (488, 179) and radius 23 then Sets a single black pixel at (247, 170).
; PLAN: r0=488(x), r1=179(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 488
LDI r1, 179
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
HALT
