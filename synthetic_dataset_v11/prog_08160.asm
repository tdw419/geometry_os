; DESCRIPTION: Composite: . Then Places a black line segment connecting (10, 238) to (201, 7). Then Places a blue dot at position (237, 73).
; PLAN: r0=10(x1), r1=238(y1), r2=201(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=237(x), r1=73(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (10, 238) to (201, 7).
; PLAN: r0=10(x1), r1=238(y1), r2=201(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 238
LDI r2, 201
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (237, 73).
; PLAN: r0=237(x), r1=73(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 73
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
