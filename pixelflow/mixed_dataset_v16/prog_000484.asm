; DESCRIPTION: Composite: Renders a white disk with center (355, 138) and radius 63 then Places a black dot at position (496, 181).
; PLAN: r0=355(x), r1=138(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x), r6=181(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 138
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 181
LDI r7, 0x000000
PSET r5, r6, r7
HALT
