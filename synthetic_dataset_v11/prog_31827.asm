; DESCRIPTION: Composite: . Then Places a red circle of radius 19 at center (40, 226). Then Sets a single orange pixel at (179, 132).
; PLAN: r0=40(x), r1=226(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=179(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red circle of radius 19 at center (40, 226).
; PLAN: r0=40(x), r1=226(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 226
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (179, 132).
; PLAN: r0=179(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
