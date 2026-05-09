; DESCRIPTION: Places a purple line segment connecting (170, 33) to (510, 56).
; PLAN: r0=170(x1), r1=33(y1), r2=510(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 33
LDI r2, 510
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
