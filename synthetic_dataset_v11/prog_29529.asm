; DESCRIPTION: Places a purple line segment connecting (21, 147) to (220, 0).
; PLAN: r0=21(x1), r1=147(y1), r2=220(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 147
LDI r2, 220
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
