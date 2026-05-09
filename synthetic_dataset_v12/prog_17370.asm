; DESCRIPTION: Places a purple line segment connecting (415, 216) to (273, 223).
; PLAN: r0=415(x1), r1=216(y1), r2=273(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 216
LDI r2, 273
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
