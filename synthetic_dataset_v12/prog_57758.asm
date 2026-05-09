; DESCRIPTION: Places a purple line segment connecting (280, 4) to (260, 200).
; PLAN: r0=280(x1), r1=4(y1), r2=260(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 4
LDI r2, 260
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
