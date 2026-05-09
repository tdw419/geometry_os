; DESCRIPTION: Composite: . Then Sets a single black pixel at (105, 137). Then Places a white circle of radius 75 at center (98, 87).
; PLAN: r0=105(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=98(x), r1=87(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (105, 137).
; PLAN: r0=105(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 75 at center (98, 87).
; PLAN: r0=98(x), r1=87(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 87
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
