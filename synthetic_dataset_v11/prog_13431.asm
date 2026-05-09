; DESCRIPTION: Composite: . Then Sets a single black pixel at (31, 26). Then Places a red line segment connecting (251, 212) to (220, 115).
; PLAN: r0=31(x), r1=26(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=251(x1), r1=212(y1), r2=220(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (31, 26).
; PLAN: r0=31(x), r1=26(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 26
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (251, 212) to (220, 115).
; PLAN: r0=251(x1), r1=212(y1), r2=220(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 212
LDI r2, 220
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
