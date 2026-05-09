; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (71, 254) to (250, 188). Then Sets a single orange pixel at (15, 101).
; PLAN: r0=71(x1), r1=254(y1), r2=250(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=15(x), r1=101(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (71, 254) to (250, 188).
; PLAN: r0=71(x1), r1=254(y1), r2=250(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 254
LDI r2, 250
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (15, 101).
; PLAN: r0=15(x), r1=101(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 101
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
