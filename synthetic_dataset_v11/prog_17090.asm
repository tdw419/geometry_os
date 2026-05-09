; DESCRIPTION: Composite: . Then Sets a single blue pixel at (20, 24). Then Places a black line segment connecting (117, 2) to (47, 33).
; PLAN: r0=20(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=117(x1), r1=2(y1), r2=47(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (20, 24).
; PLAN: r0=20(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (117, 2) to (47, 33).
; PLAN: r0=117(x1), r1=2(y1), r2=47(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 2
LDI r2, 47
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
