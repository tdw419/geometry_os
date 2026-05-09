; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (138, 131). Then Places a magenta circle of radius 37 at center (147, 165).
; PLAN: r0=138(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=147(x), r1=165(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (138, 131).
; PLAN: r0=138(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 37 at center (147, 165).
; PLAN: r0=147(x), r1=165(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 165
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
