; DESCRIPTION: Composite: . Then Creates a white circular shape at (131, 94) with radius 55. Then Sets a single orange pixel at (24, 52).
; PLAN: r0=131(x), r1=94(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=24(x), r1=52(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (131, 94) with radius 55.
; PLAN: r0=131(x), r1=94(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 94
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (24, 52).
; PLAN: r0=24(x), r1=52(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 52
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
