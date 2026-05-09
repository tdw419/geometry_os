; DESCRIPTION: Composite: . Then Sets a single purple pixel at (56, 8). Then Creates a white circular shape at (112, 173) with radius 39.
; PLAN: r0=56(x), r1=8(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=112(x), r1=173(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (56, 8).
; PLAN: r0=56(x), r1=8(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 8
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (112, 173) with radius 39.
; PLAN: r0=112(x), r1=173(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 173
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
