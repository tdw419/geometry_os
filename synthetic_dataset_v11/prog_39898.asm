; DESCRIPTION: Places a purple line segment connecting (218, 142) to (220, 217).
; PLAN: r0=218(x1), r1=142(y1), r2=220(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 142
LDI r2, 220
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
