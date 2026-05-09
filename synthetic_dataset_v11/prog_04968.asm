; DESCRIPTION: Places a purple line segment connecting (143, 36) to (44, 65).
; PLAN: r0=143(x1), r1=36(y1), r2=44(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 36
LDI r2, 44
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
