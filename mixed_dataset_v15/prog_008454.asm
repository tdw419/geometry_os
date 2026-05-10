; DESCRIPTION: Composite: Sets a single magenta pixel at (437, 106) then Places a magenta circle of radius 24 at center (232, 71).
; PLAN: r0=437(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=71(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 106
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 232
LDI r6, 71
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
