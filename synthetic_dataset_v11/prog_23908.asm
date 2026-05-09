; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (51, 255). Then Places a yellow circle of radius 26 at center (63, 35).
; PLAN: r0=51(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=63(x), r1=35(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (51, 255).
; PLAN: r0=51(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 26 at center (63, 35).
; PLAN: r0=63(x), r1=35(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 35
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
