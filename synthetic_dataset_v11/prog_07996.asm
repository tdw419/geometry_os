; DESCRIPTION: Composite: . Then Places a black dot at position (25, 157). Then Places a magenta circle of radius 56 at center (139, 185).
; PLAN: r0=25(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=139(x), r1=185(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (25, 157).
; PLAN: r0=25(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 157
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 56 at center (139, 185).
; PLAN: r0=139(x), r1=185(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 185
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
