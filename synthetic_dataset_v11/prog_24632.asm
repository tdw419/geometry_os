; DESCRIPTION: Composite: . Then Sets a single green pixel at (145, 137). Then Places a red line segment connecting (100, 136) to (221, 170).
; PLAN: r0=145(x), r1=137(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=100(x1), r1=136(y1), r2=221(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (145, 137).
; PLAN: r0=145(x), r1=137(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 137
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (100, 136) to (221, 170).
; PLAN: r0=100(x1), r1=136(y1), r2=221(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 136
LDI r2, 221
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
