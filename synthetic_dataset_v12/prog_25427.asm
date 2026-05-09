; DESCRIPTION: Composite: Sets a single black pixel at (129, 5) then Places a orange circle of radius 49 at center (368, 101).
; PLAN: r0=129(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=101(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 368
LDI r6, 101
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
