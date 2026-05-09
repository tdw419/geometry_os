; DESCRIPTION: Places a purple line segment connecting (16, 75) to (510, 150).
; PLAN: r0=16(x1), r1=75(y1), r2=510(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 75
LDI r2, 510
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
