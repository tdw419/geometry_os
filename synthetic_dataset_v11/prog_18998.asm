; DESCRIPTION: Composite: . Then Places a orange dot at position (250, 6). Then Places a red line segment connecting (179, 155) to (200, 170).
; PLAN: r0=250(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=179(x1), r1=155(y1), r2=200(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (250, 6).
; PLAN: r0=250(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (179, 155) to (200, 170).
; PLAN: r0=179(x1), r1=155(y1), r2=200(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 155
LDI r2, 200
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
