; DESCRIPTION: Composite: . Then Sets a single blue pixel at (90, 117). Then Places a magenta circle of radius 44 at center (101, 65).
; PLAN: r0=90(x), r1=117(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=101(x), r1=65(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (90, 117).
; PLAN: r0=90(x), r1=117(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 117
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 44 at center (101, 65).
; PLAN: r0=101(x), r1=65(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 65
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
