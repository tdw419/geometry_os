; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (3, 131). Then Draws a magenta circle centered at (220, 112) with radius 34.
; PLAN: r0=3(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=220(x), r1=112(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (3, 131).
; PLAN: r0=3(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (220, 112) with radius 34.
; PLAN: r0=220(x), r1=112(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 112
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
