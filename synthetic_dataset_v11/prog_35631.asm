; DESCRIPTION: Composite: . Then Places a red line segment connecting (77, 254) to (215, 145). Then Places a orange dot at position (40, 188).
; PLAN: r0=77(x1), r1=254(y1), r2=215(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=40(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (77, 254) to (215, 145).
; PLAN: r0=77(x1), r1=254(y1), r2=215(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 254
LDI r2, 215
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (40, 188).
; PLAN: r0=40(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
