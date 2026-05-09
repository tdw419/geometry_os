; DESCRIPTION: Composite: . Then Places a white line segment connecting (133, 62) to (91, 150). Then Sets a single yellow pixel at (52, 96).
; PLAN: r0=133(x1), r1=62(y1), r2=91(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (133, 62) to (91, 150).
; PLAN: r0=133(x1), r1=62(y1), r2=91(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 62
LDI r2, 91
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (52, 96).
; PLAN: r0=52(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
