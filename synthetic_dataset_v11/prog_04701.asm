; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (126, 177) with radius 62. Then Sets a single red pixel at (116, 233).
; PLAN: r0=126(x), r1=177(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x), r1=233(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (126, 177) with radius 62.
; PLAN: r0=126(x), r1=177(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 177
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (116, 233).
; PLAN: r0=116(x), r1=233(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 233
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
