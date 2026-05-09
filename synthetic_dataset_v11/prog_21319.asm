; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (104, 80) with radius 61. Then Sets a single white pixel at (143, 77).
; PLAN: r0=104(x), r1=80(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=143(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (104, 80) with radius 61.
; PLAN: r0=104(x), r1=80(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 80
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (143, 77).
; PLAN: r0=143(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
