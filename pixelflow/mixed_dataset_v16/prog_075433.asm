; DESCRIPTION: Composite: Sets a single red pixel at (491, 124) then Places a magenta circle of radius 18 at center (141, 93).
; PLAN: r0=491(x), r1=124(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=93(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 491
LDI r1, 124
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 141
LDI r6, 93
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
