; DESCRIPTION: Composite: . Then Sets a single blue pixel at (207, 52). Then Draws a cyan line from (148, 167) to (177, 216).
; PLAN: r0=207(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=148(x1), r1=167(y1), r2=177(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (207, 52).
; PLAN: r0=207(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (148, 167) to (177, 216).
; PLAN: r0=148(x1), r1=167(y1), r2=177(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 167
LDI r2, 177
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
