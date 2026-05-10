; DESCRIPTION: Composite: Sets a single yellow pixel at (325, 136) then Creates a orange circular shape at (209, 108) with radius 36.
; PLAN: r0=325(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=108(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 136
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 209
LDI r6, 108
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
