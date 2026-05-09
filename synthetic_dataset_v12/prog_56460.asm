; DESCRIPTION: Places a purple line segment connecting (255, 47) to (78, 245).
; PLAN: r0=255(x1), r1=47(y1), r2=78(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 47
LDI r2, 78
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
