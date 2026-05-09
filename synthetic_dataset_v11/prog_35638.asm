; DESCRIPTION: Composite: . Then Sets a single black pixel at (208, 251). Then Draws a magenta line from (159, 123) to (155, 94).
; PLAN: r0=208(x), r1=251(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=159(x1), r1=123(y1), r2=155(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (208, 251).
; PLAN: r0=208(x), r1=251(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 251
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (159, 123) to (155, 94).
; PLAN: r0=159(x1), r1=123(y1), r2=155(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 123
LDI r2, 155
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
