; DESCRIPTION: Composite: Places a yellow circle of radius 44 at center (404, 71) then Sets a single black pixel at (362, 247).
; PLAN: r0=404(x), r1=71(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=247(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 71
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 247
LDI r7, 0x000000
PSET r5, r6, r7
HALT
