; DESCRIPTION: Composite: Sets a single orange pixel at (254, 226) then Creates a green circular shape at (298, 158) with radius 28.
; PLAN: r0=254(x), r1=226(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=158(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 226
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 298
LDI r6, 158
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
