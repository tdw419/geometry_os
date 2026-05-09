; DESCRIPTION: Places a purple line segment connecting (362, 75) to (16, 200).
; PLAN: r0=362(x1), r1=75(y1), r2=16(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 75
LDI r2, 16
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
