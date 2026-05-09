; DESCRIPTION: Places a purple line segment connecting (156, 120) to (44, 175).
; PLAN: r0=156(x1), r1=120(y1), r2=44(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 120
LDI r2, 44
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
