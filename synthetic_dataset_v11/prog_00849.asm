; DESCRIPTION: Places a purple line segment connecting (156, 193) to (195, 49).
; PLAN: r0=156(x1), r1=193(y1), r2=195(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 193
LDI r2, 195
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
