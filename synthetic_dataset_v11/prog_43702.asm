; DESCRIPTION: Composite: . Then Sets a single black pixel at (34, 131). Then Places a red circle of radius 25 at center (164, 220).
; PLAN: r0=34(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=164(x), r1=220(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (34, 131).
; PLAN: r0=34(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 131
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 25 at center (164, 220).
; PLAN: r0=164(x), r1=220(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 220
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
