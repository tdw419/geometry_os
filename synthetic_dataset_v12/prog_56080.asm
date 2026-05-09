; DESCRIPTION: Places a purple line segment connecting (487, 70) to (222, 70).
; PLAN: r0=487(x1), r1=70(y1), r2=222(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 70
LDI r2, 222
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
