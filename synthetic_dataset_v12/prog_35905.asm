; DESCRIPTION: Composite: Sets a single purple pixel at (329, 23) then Draws a orange circle centered at (141, 77) with radius 72.
; PLAN: r0=329(x), r1=23(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=77(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 23
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 141
LDI r6, 77
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
