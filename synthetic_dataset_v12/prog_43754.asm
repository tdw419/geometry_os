; DESCRIPTION: Composite: Sets a single red pixel at (342, 74) then Creates a white circular shape at (352, 47) with radius 33.
; PLAN: r0=342(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=47(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 352
LDI r6, 47
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
