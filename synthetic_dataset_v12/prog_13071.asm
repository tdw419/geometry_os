; DESCRIPTION: Composite: Sets a single purple pixel at (336, 252) then Draws a orange circle centered at (89, 106) with radius 10.
; PLAN: r0=336(x), r1=252(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=106(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 252
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 89
LDI r6, 106
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
