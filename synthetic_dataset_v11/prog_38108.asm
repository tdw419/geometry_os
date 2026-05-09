; DESCRIPTION: Composite: . Then Places a black line segment connecting (166, 143) to (172, 201). Then Sets a single cyan pixel at (34, 69).
; PLAN: r0=166(x1), r1=143(y1), r2=172(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=34(x), r1=69(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (166, 143) to (172, 201).
; PLAN: r0=166(x1), r1=143(y1), r2=172(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 143
LDI r2, 172
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (34, 69).
; PLAN: r0=34(x), r1=69(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 69
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
