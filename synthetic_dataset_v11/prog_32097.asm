; DESCRIPTION: Composite: . Then Places a magenta dot at position (47, 51). Then Draws a magenta line from (145, 15) to (157, 216).
; PLAN: r0=47(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=145(x1), r1=15(y1), r2=157(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (47, 51).
; PLAN: r0=47(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (145, 15) to (157, 216).
; PLAN: r0=145(x1), r1=15(y1), r2=157(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 15
LDI r2, 157
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
