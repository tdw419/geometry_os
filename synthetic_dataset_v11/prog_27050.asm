; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (167, 17). Then Places a blue circle of radius 47 at center (143, 200).
; PLAN: r0=167(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=143(x), r1=200(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (167, 17).
; PLAN: r0=167(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 47 at center (143, 200).
; PLAN: r0=143(x), r1=200(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 200
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
