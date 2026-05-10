; DESCRIPTION: Composite: Places a red circle of radius 59 at center (251, 182) then Places a black dot at position (286, 160).
; PLAN: r0=251(x), r1=182(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=160(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 182
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 160
LDI r7, 0x000000
PSET r5, r6, r7
HALT
