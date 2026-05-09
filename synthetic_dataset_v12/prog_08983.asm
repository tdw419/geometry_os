; DESCRIPTION: Composite: Sets a single black pixel at (102, 54) then Places a yellow circle of radius 76 at center (147, 159).
; PLAN: r0=102(x), r1=54(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=159(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 54
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 147
LDI r6, 159
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
