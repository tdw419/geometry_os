; DESCRIPTION: Composite: . Then Draws a white line from (71, 200) to (47, 199). Then Sets a single purple pixel at (129, 234).
; PLAN: r0=71(x1), r1=200(y1), r2=47(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=129(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (71, 200) to (47, 199).
; PLAN: r0=71(x1), r1=200(y1), r2=47(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 200
LDI r2, 47
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (129, 234).
; PLAN: r0=129(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 234
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
