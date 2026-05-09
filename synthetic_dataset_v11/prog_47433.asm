; DESCRIPTION: Composite: . Then Creates a black circular shape at (120, 137) with radius 19. Then Sets a single cyan pixel at (160, 170).
; PLAN: r0=120(x), r1=137(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (120, 137) with radius 19.
; PLAN: r0=120(x), r1=137(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 137
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (160, 170).
; PLAN: r0=160(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 170
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
