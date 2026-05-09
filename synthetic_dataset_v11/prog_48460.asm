; DESCRIPTION: Composite: . Then Draws a red line from (79, 145) to (174, 49). Then Sets a single yellow pixel at (12, 36).
; PLAN: r0=79(x1), r1=145(y1), r2=174(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=12(x), r1=36(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (79, 145) to (174, 49).
; PLAN: r0=79(x1), r1=145(y1), r2=174(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 145
LDI r2, 174
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (12, 36).
; PLAN: r0=12(x), r1=36(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 36
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
