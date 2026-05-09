; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (61, 76) with radius 38. Then Sets a single purple pixel at (118, 159).
; PLAN: r0=61(x), r1=76(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=118(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (61, 76) with radius 38.
; PLAN: r0=61(x), r1=76(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 76
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (118, 159).
; PLAN: r0=118(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 159
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
