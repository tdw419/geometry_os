; DESCRIPTION: Composite: . Then Places a purple line segment connecting (65, 21) to (132, 233). Then Places a purple dot at position (24, 218).
; PLAN: r0=65(x1), r1=21(y1), r2=132(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (65, 21) to (132, 233).
; PLAN: r0=65(x1), r1=21(y1), r2=132(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 21
LDI r2, 132
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (24, 218).
; PLAN: r0=24(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
