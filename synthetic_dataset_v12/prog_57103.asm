; DESCRIPTION: Composite: Renders a black disk with center (170, 133) and radius 69 then Places a red dot at position (418, 130).
; PLAN: r0=170(x), r1=133(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=130(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 170
LDI r1, 133
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 130
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
