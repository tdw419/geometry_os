; DESCRIPTION: Places a purple line segment connecting (120, 73) to (260, 155).
; PLAN: r0=120(x1), r1=73(y1), r2=260(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 73
LDI r2, 260
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
