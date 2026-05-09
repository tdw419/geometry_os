; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (128, 179) with radius 71. Then Sets a single yellow pixel at (254, 158).
; PLAN: r0=128(x), r1=179(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x), r1=158(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (128, 179) with radius 71.
; PLAN: r0=128(x), r1=179(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 179
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (254, 158).
; PLAN: r0=254(x), r1=158(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 158
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
