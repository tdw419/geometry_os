; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (80, 43). Then Places a red circle of radius 58 at center (111, 86).
; PLAN: r0=80(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=111(x), r1=86(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (80, 43).
; PLAN: r0=80(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 58 at center (111, 86).
; PLAN: r0=111(x), r1=86(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 86
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
