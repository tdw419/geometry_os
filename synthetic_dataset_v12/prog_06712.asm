; DESCRIPTION: Composite: Sets a single purple pixel at (293, 225) then Draws a red circle centered at (193, 114) with radius 77.
; PLAN: r0=293(x), r1=225(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=114(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 225
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 114
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
