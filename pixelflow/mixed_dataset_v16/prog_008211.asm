; DESCRIPTION: Composite: Sets a single black pixel at (102, 166) then Places a yellow circle of radius 78 at center (399, 167).
; PLAN: r0=102(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=167(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 399
LDI r6, 167
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
