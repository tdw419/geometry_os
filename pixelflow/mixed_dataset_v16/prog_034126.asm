; DESCRIPTION: Composite: Sets a single orange pixel at (342, 132) then Draws a black circle centered at (200, 74) with radius 27.
; PLAN: r0=342(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=74(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 200
LDI r6, 74
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
