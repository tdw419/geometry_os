; DESCRIPTION: Composite: Sets a single purple pixel at (76, 7) then Creates a purple circular shape at (219, 213) with radius 36.
; PLAN: r0=76(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=213(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 213
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
