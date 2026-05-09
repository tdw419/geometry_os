; DESCRIPTION: Composite: Renders a black disk with center (145, 131) and radius 47 then Places a yellow dot at position (98, 156).
; PLAN: r0=145(x), r1=131(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 131
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
