; DESCRIPTION: Places a purple line segment connecting (489, 76) to (509, 245).
; PLAN: r0=489(x1), r1=76(y1), r2=509(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 76
LDI r2, 509
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
