; DESCRIPTION: Composite: . Then Sets a single green pixel at (94, 67). Then Creates a black circular shape at (72, 179) with radius 50.
; PLAN: r0=94(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=72(x), r1=179(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (94, 67).
; PLAN: r0=94(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (72, 179) with radius 50.
; PLAN: r0=72(x), r1=179(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 179
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
