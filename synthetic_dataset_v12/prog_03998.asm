; DESCRIPTION: Places a purple line segment connecting (304, 144) to (40, 233).
; PLAN: r0=304(x1), r1=144(y1), r2=40(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 144
LDI r2, 40
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
