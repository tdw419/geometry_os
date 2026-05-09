; DESCRIPTION: Composite: . Then Creates a black circular shape at (72, 183) with radius 70. Then Sets a single yellow pixel at (25, 25).
; PLAN: r0=72(x), r1=183(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=25(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (72, 183) with radius 70.
; PLAN: r0=72(x), r1=183(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 183
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (25, 25).
; PLAN: r0=25(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 25
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
