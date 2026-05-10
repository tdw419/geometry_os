; DESCRIPTION: Places a purple line segment connecting (152, 119) to (315, 57).
; PLAN: r0=152(x1), r1=119(y1), r2=315(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 119
LDI r2, 315
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
