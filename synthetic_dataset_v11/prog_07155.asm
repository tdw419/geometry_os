; DESCRIPTION: Composite: . Then Places a white line segment connecting (132, 254) to (37, 62). Then Sets a single yellow pixel at (194, 84).
; PLAN: r0=132(x1), r1=254(y1), r2=37(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=194(x), r1=84(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (132, 254) to (37, 62).
; PLAN: r0=132(x1), r1=254(y1), r2=37(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 254
LDI r2, 37
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (194, 84).
; PLAN: r0=194(x), r1=84(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 84
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
