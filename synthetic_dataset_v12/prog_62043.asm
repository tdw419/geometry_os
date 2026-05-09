; DESCRIPTION: Places a purple line segment connecting (83, 66) to (416, 141).
; PLAN: r0=83(x1), r1=66(y1), r2=416(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 66
LDI r2, 416
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
