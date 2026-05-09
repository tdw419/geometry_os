; DESCRIPTION: Composite: Sets a single black pixel at (424, 186) then Places a blue circle of radius 51 at center (98, 60).
; PLAN: r0=424(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=60(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 424
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 98
LDI r6, 60
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
