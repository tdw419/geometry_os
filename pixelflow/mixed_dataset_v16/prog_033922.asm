; DESCRIPTION: Composite: Sets a single yellow pixel at (430, 163) then Places a white circle of radius 45 at center (295, 165).
; PLAN: r0=430(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=165(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 430
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 295
LDI r6, 165
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
