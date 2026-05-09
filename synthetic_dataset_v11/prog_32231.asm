; DESCRIPTION: Composite: . Then Places a blue dot at position (201, 122). Then Places a black line segment connecting (85, 191) to (152, 34).
; PLAN: r0=201(x), r1=122(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=85(x1), r1=191(y1), r2=152(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (201, 122).
; PLAN: r0=201(x), r1=122(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 122
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (85, 191) to (152, 34).
; PLAN: r0=85(x1), r1=191(y1), r2=152(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 191
LDI r2, 152
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
