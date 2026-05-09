; DESCRIPTION: Composite: Sets a single blue pixel at (339, 174) then Places a red circle of radius 33 at center (249, 78).
; PLAN: r0=339(x), r1=174(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=78(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 174
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 78
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
