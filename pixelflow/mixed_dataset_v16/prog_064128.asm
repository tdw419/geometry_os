; DESCRIPTION: Places a purple line segment connecting (288, 57) to (85, 255).
; PLAN: r0=288(x1), r1=57(y1), r2=85(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 57
LDI r2, 85
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
