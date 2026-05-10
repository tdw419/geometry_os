; DESCRIPTION: Places a purple line segment connecting (367, 57) to (226, 84).
; PLAN: r0=367(x1), r1=57(y1), r2=226(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 57
LDI r2, 226
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
