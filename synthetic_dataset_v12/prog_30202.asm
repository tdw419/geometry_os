; DESCRIPTION: Places a purple line segment connecting (357, 193) to (255, 252).
; PLAN: r0=357(x1), r1=193(y1), r2=255(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 193
LDI r2, 255
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
