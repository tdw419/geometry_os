; DESCRIPTION: Composite: Sets a single green pixel at (78, 132) then Creates a yellow circular shape at (360, 86) with radius 30.
; PLAN: r0=78(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=86(y), r7=30(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 360
LDI r6, 86
LDI r7, 30
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
