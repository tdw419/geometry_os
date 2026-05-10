; DESCRIPTION: Composite: Places a red circle of radius 73 at center (325, 129) then Sets a single red pixel at (226, 101).
; PLAN: r0=325(x), r1=129(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 129
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
