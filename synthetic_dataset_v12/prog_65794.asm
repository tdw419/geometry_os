; DESCRIPTION: Places a purple line segment connecting (186, 72) to (146, 147).
; PLAN: r0=186(x1), r1=72(y1), r2=146(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 72
LDI r2, 146
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
