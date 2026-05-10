; DESCRIPTION: Places a purple line segment connecting (187, 60) to (370, 70).
; PLAN: r0=187(x1), r1=60(y1), r2=370(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 60
LDI r2, 370
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
