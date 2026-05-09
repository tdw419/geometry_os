; DESCRIPTION: Composite: . Then Sets a single orange pixel at (171, 3). Then Places a cyan circle of radius 74 at center (115, 105).
; PLAN: r0=171(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=115(x), r1=105(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (171, 3).
; PLAN: r0=171(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 74 at center (115, 105).
; PLAN: r0=115(x), r1=105(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 105
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
