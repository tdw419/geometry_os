; DESCRIPTION: Composite: Sets a single red pixel at (398, 145) then Places a red circle of radius 14 at center (384, 75).
; PLAN: r0=398(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=75(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 384
LDI r6, 75
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
