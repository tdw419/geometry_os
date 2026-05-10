; DESCRIPTION: Places a purple line segment connecting (422, 187) to (16, 119).
; PLAN: r0=422(x1), r1=187(y1), r2=16(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 187
LDI r2, 16
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
