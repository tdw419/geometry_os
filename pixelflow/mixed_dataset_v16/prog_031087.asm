; DESCRIPTION: Places a purple line segment connecting (23, 70) to (455, 107).
; PLAN: r0=23(x1), r1=70(y1), r2=455(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 70
LDI r2, 455
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
