; DESCRIPTION: Composite: . Then Places a magenta circle of radius 10 at center (90, 104). Then Sets a single black pixel at (145, 48).
; PLAN: r0=90(x), r1=104(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=145(x), r1=48(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 10 at center (90, 104).
; PLAN: r0=90(x), r1=104(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 104
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (145, 48).
; PLAN: r0=145(x), r1=48(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 48
LDI r2, 0x000000
PSET r0, r1, r2
HALT
