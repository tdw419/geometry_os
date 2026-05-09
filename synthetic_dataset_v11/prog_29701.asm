; DESCRIPTION: Composite: . Then Creates a red circular shape at (73, 140) with radius 62. Then Sets a single magenta pixel at (86, 56).
; PLAN: r0=73(x), r1=140(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=86(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (73, 140) with radius 62.
; PLAN: r0=73(x), r1=140(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 140
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (86, 56).
; PLAN: r0=86(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 56
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
