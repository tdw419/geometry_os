; DESCRIPTION: Composite: Renders a purple disk with center (148, 89) and radius 69 then Places a yellow dot at position (64, 58).
; PLAN: r0=148(x), r1=89(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=58(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 89
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 58
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
