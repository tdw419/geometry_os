; DESCRIPTION: Composite: Sets a single blue pixel at (133, 215) then Places a orange circle of radius 80 at center (399, 97).
; PLAN: r0=133(x), r1=215(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=97(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 215
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 97
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
