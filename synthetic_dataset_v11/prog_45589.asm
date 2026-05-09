; DESCRIPTION: Composite: . Then Creates a purple circular shape at (115, 135) with radius 56. Then Sets a single black pixel at (104, 45).
; PLAN: r0=115(x), r1=135(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (115, 135) with radius 56.
; PLAN: r0=115(x), r1=135(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 135
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (104, 45).
; PLAN: r0=104(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
HALT
