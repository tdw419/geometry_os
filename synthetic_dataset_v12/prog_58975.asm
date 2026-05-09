; DESCRIPTION: Places a purple line segment connecting (205, 70) to (411, 117).
; PLAN: r0=205(x1), r1=70(y1), r2=411(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 70
LDI r2, 411
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
