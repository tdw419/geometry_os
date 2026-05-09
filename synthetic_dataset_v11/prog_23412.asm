; DESCRIPTION: Composite: . Then Places a black line segment connecting (87, 169) to (66, 110). Then Sets a single black pixel at (64, 185).
; PLAN: r0=87(x1), r1=169(y1), r2=66(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=64(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (87, 169) to (66, 110).
; PLAN: r0=87(x1), r1=169(y1), r2=66(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 169
LDI r2, 66
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (64, 185).
; PLAN: r0=64(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
HALT
