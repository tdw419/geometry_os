; DESCRIPTION: Composite: Sets a single red pixel at (51, 182) then Renders a blue disk with center (256, 199) and radius 20.
; PLAN: r0=51(x), r1=182(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=199(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 51
LDI r1, 182
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 256
LDI r6, 199
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
