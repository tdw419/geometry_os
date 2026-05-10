; DESCRIPTION: Composite: Sets a single cyan pixel at (173, 43) then Creates a blue circular shape at (349, 36) with radius 19.
; PLAN: r0=173(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=36(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 349
LDI r6, 36
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
