; DESCRIPTION: Places a red line segment connecting (140, 191) to (153, 86).
; PLAN: r0=140(x1), r1=191(y1), r2=153(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 191
LDI r2, 153
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
