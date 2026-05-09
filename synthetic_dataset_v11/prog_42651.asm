; DESCRIPTION: Composite: . Then Places a magenta dot at position (199, 241). Then Draws a black line from (47, 120) to (155, 7).
; PLAN: r0=199(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=47(x1), r1=120(y1), r2=155(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (199, 241).
; PLAN: r0=199(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (47, 120) to (155, 7).
; PLAN: r0=47(x1), r1=120(y1), r2=155(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 120
LDI r2, 155
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
