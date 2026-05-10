; DESCRIPTION: Composite: Sets a single purple pixel at (293, 165) then Creates a green circular shape at (218, 150) with radius 37.
; PLAN: r0=293(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=150(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 150
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
