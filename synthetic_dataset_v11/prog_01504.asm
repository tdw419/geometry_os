; DESCRIPTION: Places a purple line segment connecting (52, 77) to (156, 54).
; PLAN: r0=52(x1), r1=77(y1), r2=156(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 77
LDI r2, 156
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
