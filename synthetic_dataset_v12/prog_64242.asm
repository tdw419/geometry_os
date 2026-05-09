; DESCRIPTION: Composite: Sets a single yellow pixel at (227, 87) then Places a orange circle of radius 19 at center (222, 64).
; PLAN: r0=227(x), r1=87(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=64(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 227
LDI r1, 87
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 222
LDI r6, 64
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
