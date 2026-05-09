; DESCRIPTION: Composite: . Then Renders a white line between points (153, 119) and (102, 183). Then Sets a single orange pixel at (39, 64).
; PLAN: r0=153(x1), r1=119(y1), r2=102(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=39(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (153, 119) and (102, 183).
; PLAN: r0=153(x1), r1=119(y1), r2=102(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 119
LDI r2, 102
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (39, 64).
; PLAN: r0=39(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
