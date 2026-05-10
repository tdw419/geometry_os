; DESCRIPTION: Composite: Sets a single red pixel at (23, 57) then Places a red circle of radius 34 at center (332, 107).
; PLAN: r0=23(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=107(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 107
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
