; DESCRIPTION: Composite: . Then Sets a single red pixel at (227, 217). Then Draws a orange line from (89, 21) to (143, 169).
; PLAN: r0=227(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=89(x1), r1=21(y1), r2=143(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (227, 217).
; PLAN: r0=227(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (89, 21) to (143, 169).
; PLAN: r0=89(x1), r1=21(y1), r2=143(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 21
LDI r2, 143
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
