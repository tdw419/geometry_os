; DESCRIPTION: Composite: . Then Places a red line segment connecting (157, 94) to (30, 62). Then Sets a single red pixel at (62, 187).
; PLAN: r0=157(x1), r1=94(y1), r2=30(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (157, 94) to (30, 62).
; PLAN: r0=157(x1), r1=94(y1), r2=30(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 94
LDI r2, 30
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (62, 187).
; PLAN: r0=62(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
