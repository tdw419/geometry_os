; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (9, 194). Then Draws a magenta line from (150, 217) to (155, 77).
; PLAN: r0=9(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=150(x1), r1=217(y1), r2=155(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (9, 194).
; PLAN: r0=9(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 194
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (150, 217) to (155, 77).
; PLAN: r0=150(x1), r1=217(y1), r2=155(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 217
LDI r2, 155
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
