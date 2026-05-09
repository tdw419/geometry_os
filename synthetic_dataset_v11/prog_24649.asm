; DESCRIPTION: Composite: . Then Sets a single blue pixel at (86, 105). Then Places a black line segment connecting (132, 145) to (199, 142).
; PLAN: r0=86(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=132(x1), r1=145(y1), r2=199(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (86, 105).
; PLAN: r0=86(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 105
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (132, 145) to (199, 142).
; PLAN: r0=132(x1), r1=145(y1), r2=199(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 145
LDI r2, 199
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
