; DESCRIPTION: Places a purple line segment connecting (65, 9) to (241, 245).
; PLAN: r0=65(x1), r1=9(y1), r2=241(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 9
LDI r2, 241
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
