; DESCRIPTION: Composite: Sets a single orange pixel at (370, 35) then Renders a purple disk with center (51, 52) and radius 35.
; PLAN: r0=370(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=52(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 370
LDI r1, 35
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 51
LDI r6, 52
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
