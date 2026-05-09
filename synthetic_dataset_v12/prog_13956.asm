; DESCRIPTION: Places a purple line segment connecting (408, 109) to (13, 150).
; PLAN: r0=408(x1), r1=109(y1), r2=13(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 109
LDI r2, 13
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
