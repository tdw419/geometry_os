; DESCRIPTION: Composite: Sets a single orange pixel at (428, 142) then Places a green circle of radius 51 at center (369, 81).
; PLAN: r0=428(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=81(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 369
LDI r6, 81
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
