; DESCRIPTION: Places a purple line segment connecting (321, 120) to (489, 195).
; PLAN: r0=321(x1), r1=120(y1), r2=489(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 120
LDI r2, 489
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
