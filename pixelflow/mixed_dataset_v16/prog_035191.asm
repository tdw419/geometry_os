; DESCRIPTION: Composite: Renders a black disk with center (61, 88) and radius 59 then Places a black dot at position (36, 90).
; PLAN: r0=61(x), r1=88(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=90(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 88
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 90
LDI r7, 0x000000
PSET r5, r6, r7
HALT
