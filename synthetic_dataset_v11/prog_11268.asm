; DESCRIPTION: Places a purple line segment connecting (174, 191) to (18, 30).
; PLAN: r0=174(x1), r1=191(y1), r2=18(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 191
LDI r2, 18
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
