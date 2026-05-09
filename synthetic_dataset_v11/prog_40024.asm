; DESCRIPTION: Composite: . Then Places a magenta circle of radius 79 at center (109, 94). Then Sets a single orange pixel at (153, 29).
; PLAN: r0=109(x), r1=94(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=153(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 79 at center (109, 94).
; PLAN: r0=109(x), r1=94(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 94
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (153, 29).
; PLAN: r0=153(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
