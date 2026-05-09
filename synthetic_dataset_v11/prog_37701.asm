; DESCRIPTION: Composite: . Then Sets a single blue pixel at (89, 60). Then Creates a white circular shape at (92, 143) with radius 80.
; PLAN: r0=89(x), r1=60(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=92(x), r1=143(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (89, 60).
; PLAN: r0=89(x), r1=60(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 60
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (92, 143) with radius 80.
; PLAN: r0=92(x), r1=143(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 143
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
